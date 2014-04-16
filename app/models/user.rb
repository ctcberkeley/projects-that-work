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
    validates_presence_of :role
  end

  ROLES = ["Teacher", "Student"]

  def is_teacher
  	return self.role == "Teacher"
  end
end
