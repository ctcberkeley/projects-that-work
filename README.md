# Projects That Work

This application is intended to provide teachers with a means to post service-oriented projects they have worked on with their students so that other teachers can emulate these projects with their own students.

### Setup

Copy over the template `database.yml` and fill it in with the necessary information for your local database setup.

    cp config/template/database.yml config/

Create the database.

    rake db:create

Migrate the database.

    rake db:migrate

Two schools are generated from the seed.rb file

### Instructions to Use Web App

1) Sign-up as a Teacher or a Student 

2a) A Project page contains with specifications that other teachers across the country will find valuable in order to implement Project Classes of the service-based learning projects in their own school districts. 

2b) A Project Class consists basically of a teacher and students that are working on the Project. 

2c) Anyone can search for Projects by filtering the specific fields such as grade level or subject or number of recommended students. 

2d) Only Teachers can create new projects and project classes

3a) Both Students and Teachers can create Reviews for Projects, but they differ in the fields. For instance, Student Reviews have a learningScore while Teacher Reviews
have an educatorScore. These different types of Reviews are stored using Single Table Inheritence with a dynamic hash attribute named :field.

3b) Teachers and Students can only make one review per project they belong to or have created. Once the review has been made it can be edited or deleted. 

3c) All the Reviews for a Project are separated into Teacher and Student Reviews and the average ratings are displayed along with the general Project info.

3d) All the reviews created by the user can be found on the User Profile page as well as all the projects they belong to or have created. 

4) When Teachers create a Project Class they can add Students to the Project Class by their emails. In the future we would like Students to recieve an email notification to join the project and sign up to Projects That Work if they are not sign up already. 

    