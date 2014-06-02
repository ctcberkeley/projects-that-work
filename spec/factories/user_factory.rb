# This will guess the User class
FactoryGirl.define do
  factory :user do
    password "foobar"
   	
    trait :teacher do
   		role "Teacher"
   		sequence(:username) {|n| "teacher#{n}" }
      sequence(:email) {|n| "teacheremail#{n}@factory.com" }
    	first_name "Teacher"
    	last_name  "A"
   	end

   	trait :student do
   		role "Student"
      sequence(:username) {|n| "student#{n}" }
      sequence(:email) {|n| "studentemail#{n}@factory.com" }
    	first_name "student"
    	last_name  "A"
   	end
  end
end