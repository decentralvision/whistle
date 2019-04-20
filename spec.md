# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
Yup!
- [x] Use ActiveRecord for storing information in a database
Yup!
- [x] Include more than one model class (e.g. User, Post, Category)
User and Report
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
User has many reports
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
Report belongs to User
- [x] Include user accounts with unique login attribute (username or email)
Username is verified unique
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Users are able to create, read, update and destroy reports
- [x] Ensure that users can't modify content created by other users
users_report? method verifies the user has permission to edit or delete the report on form submission. The edit page checks users_report? on get request. Additionally, the edit and delete buttons only appear if users_report? returns true.
- [x] Include user input validations
Input is validated so that the location isn't empty, also report submission verifies the event and suspect description are greater than 60 characters.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
Rack-flash displays errors for invalid report submission and login/signup errors.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Readme includes all of these, instead of a link I copy/pasted the license directly into the readme.

Confirm
- [x] You have a large number of small Git commits
True, although I could probably commit more often.
- [x] Your commit messages are meaningful
My commit messages are meaningful although they could be more descriptive.
- [x] You made the changes in a commit that relate to the commit message
Commit messages are always related to the changes made. 
- [x] You don't include changes in a commit that aren't related to the commit message
Commit messages sometimes do not include every detail of every change, but do generally describe every change made. 