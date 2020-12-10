# Workshop Planner
## Overview
Ever had to plan a workshop? A retro? Or maybe an entire design sprint? 
Workshop planner saves you from digging in your old files to find that template you vaguely recall using the last time by providing a space to keep track of all your workshop plans. Create your own plans or use the provided plans as a starting point.


## Link
Plan a workshop: [workshop-plan.herokuapp.com](https://workshop-plan.herokuapp.com/)

## Tech stack

- Ruby on Rails
- CSS

## Features

Logged in users:
- Create public and private workshops and tasks
- Clone template and public workshops and tasks
- View personal, template and public workshops and tasks
- Add and remove tasks to/from workshops
- Delete personal workshops and tasks
- Logout

Logged out users:
- View public and template workshops and tasks
- Create an account
- Log in

### Future features:
- Re-order tasks in a workshop plan
- Automatically calculate the total duration of a workshop based on the duration of its tasks
- Count down timer to help you keep track of your workshop in action
- Responsive design

[View full list of current and future features on trello.](https://trello.com/invite/b/0HBsn2Tl/bfe64da0ba313fa531003da977d0b31c/workshop-planner)


### Designs and Database diagrams
[View initial concepts and database diagrams on figma](https://www.figma.com/file/8OF5syt1JJbXythgf36XQv/Workshop-planner?node-id=0%3A1)

## Known bugs

- New tasks are not associated with their relevant workshops due to removal of workshops >-< tasks relationship. Users can still create new tasks and assign them to a workshop. The assignment is not done at the point of creation.
- Time must be entered in seconds when creating a task
- Workshop duration (total_time) must be calculated manually and entered in the database

...and it definitely needs to be refactored...especially the CSS
