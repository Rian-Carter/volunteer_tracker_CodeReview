# Volunteer Tracker

#### Created by Rian Carter

## An application to track projects and the volunteers working on them.

## Link to Volunteer Tracker

* https://github.com/Rian-Carter/volunteer_tracker_CodeReview.git

## Technologies Used

* Ruby
* RSPEC
* pry
* sinatra
* sinatra-contrib
* capybara
* Postgres
* PSQL

## This application will allow a user to add, view, update, and delete projects. It will also add, view, update, and delete volunteers for each project.

## User Stories

* As a non-profit employee, I want to view, add, update and delete projects.
* As a non-profit employee, I want to view and add volunteers.
* As a non-profit employee, I want to add volunteers to a project.

## Setup/Installation Requirements

* Clone this project using $ git clone https://github.com/Rian-Carter/volunteer_tracker_CodeReview.git
* Open in a text editor such as VS Code
* If on windows you will need to create a file in the root directory of the project called 'db_access.rb' and within that file you will need to add the following: 'DB = PG.connect({:dbname => 'volunteer_tracker', :password => '[YOUR PASSWORD GOES HERE]'})'.
  * If on mac you will need to navigate to 'spec_helper.rb' and add 'DB = PG.connect({:dbname => 'volunteer_tracker})' below the require statements.
* In your terminal you will need to run the command 'bundle install'
* In the terminal run command 'rspec' to see tests passing
* In your terminal you will need to run the command 'postgres' to start up a server
* In your terminal you will then need to run the command 'ruby app.rb'
* In your web browser navigate to 'localhost:4567' and enjoy

## Known Bugs

* There are no known bugs at this time
* Please forward any bugs to R.c@rt3%8*@ho***il.com

## License

* MIT https://en.wikipedia.org/wiki/MIT_License
* Copyright (C) 5/19/2022