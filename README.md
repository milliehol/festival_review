# README

Purpose of Application¶ ↑

Allows user to sign up, create festivals, and review festivals.  Only each individual user can edit their festival.


    Ruby Version: Ruby 2.7

    Rails Version: Rails 6.0.3


Database and Application Setup¶ ↑

Run

bundle install

Once gems are installed, run the following:

rails db:create
rails db:migrate
rails db:seed

For information on the database credentials to be used, see the config/database.yml file for more information.

rails s

Go to localhost:3000/ and you should see the homepage
