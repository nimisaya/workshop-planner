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
- Count down timer to help you keep track of your workshop in action
- Responsive design

[View full list of current and future features on trello.](https://trello.com/invite/b/0HBsn2Tl/bfe64da0ba313fa531003da977d0b31c/workshop-planner)


### Designs and Database diagrams
[View initial concepts and database diagrams on figma]()

## Known bugs

- New tasks are not associated with their relevant workshops due to removal of workshops >-< tasks relationship
- Time must be entered in seconds when creating a task

...and it definitely needs to be refactored...especially the CSS
