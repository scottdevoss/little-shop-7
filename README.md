# Little Esty Shop

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Summary of Work Completed
- In this project, our team deployed an interactive website that made it easy for merchants and admins to manage inventory and fulfill customer invoices. To start, we build fairly basic dashboard, index and show pages to view and navigate between items and invoices. Then, we were able to build out more complex requests such as adding items and merchants, editing capabilities, including timestamps and calculating total revenue. 
- We started adding styling to our pages to make it more user friendly and easier to read. If we were to add to this project with more time, we would like to spend more time styling. We realize we can go down a rabbit hole with styling, but this way it will feel more polished and professional. We would also like to revisit our controllers to make sure they do not have too much logic in them as well as models to make them as clean as possible. 

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- [Optional] Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- Must use Rails 7.0.x, Ruby 3.2.2
- Must use PostgreSQL
- All code must be tested via feature tests and model tests, respectively
- Must use GitHub branching, team code reviews via GitHub PR comments, and either GitHub Projects or a project management tool of your group's choice (Trello, Notion, etc.)
- Must include a thorough README to describe the project
   - README should include a basic description of the project, a summary of the work completed, and some ideas for a potential contributor to work on/refactor next. Also include the names and GitHub links of all student contributors on your project. 
- Must deploy completed code to the internet (using Heroku or Render)
- Continuous Integration / Continuous Deployment is not allowed
- Use of scaffolding is not allowed
- Any gems added to the project must be approved by an instructor
  - Pre-approved gems are `capybara, pry, faker, factory_bot_rails, orderly, simplecov, shoulda-matchers, launchy`

## Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)
