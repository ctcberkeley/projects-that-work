class User < ActiveRecord::Base
  belongs_to :school
  has_many :projects
  has_many :reviews
  has_many :student_reviews
  has_many :teacher_reviews

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.session_class = UserSession
    c.require_password_confirmation = false
    c.login_field = :email
    validates_presence_of :role, :school, :first_name, :last_name, :username
  end

  ROLES = ["Teacher", "Student"]

  def is_teacher
  	return self.role == "Teacher"
  end

  def is_student
    return self.role == "Student"
  end

  def get_teacher_or_student
    if is_teacher
      return Teacher.get_teacher(id)
    elsif is_student
      return Student.get_student(id)
    end
  end

  def self.by_email(email)
    User.find_by email: email
  end

  def has_reviewed_project?(proj_id)
    has_reviewed = false
    self.reviews.each do |review| 
      if review.project_id == proj_id
       has_reviewed = true
      end
    end
    return has_reviewed
  end

  def get_project_review(proj_id)
     proj_review = nil
    self.reviews.each do |review| 
      if review.project_id == proj_id
       proj_review = review 
      end
    end
    return proj_review
  end

#returns list of project_id of projects you have reviewed
  def reviewed_project_ids
    self.reviews.map!{|review| review.project_id}
  end

  def reviewed_projects
    reviewed_project_ids.map! {|id| Project.find(id)}
  end

  def reviewable_projects
    reviewed_projs_list = reviewed_projects
    user = get_teacher_or_student
    if is_teacher
      temp = user.projects.keep_if {|proj| not reviewed_projs_list.include? proj }
      return temp
    elsif is_student
      user.project_classes.keep_if {|projclass| not reviewed_projs_list.include? Project.find(projclass.project_id)}
    end
  end

end
