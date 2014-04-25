# Projects That Work

This application is intended to provide teachers with a means to post service-oriented projects they have worked on with their students so that other teachers can emulate these projects with their own students.

### Setup

Copy over the template `database.yml` and fill it in with the necessary information for your local database setup.

    cp config/template/database.yml config

Create the database.

    rake db:create

Migrate the database.

    rake db:migrate
