# Seed data for Users
User.destroy_all

print "Creating users..."

user1 = User.create!(
    email: "a@b.com",
    password: 'yayaya',
    username: 'Aya'
)

user2 = User.create!(
    email: "b@c.com",
    password: 'yayaya',
    username: 'Yoyo'
)

puts "Created #{User.count} users."


print "Creating workshops..."
Workshop.destroy_all

w1 = Workshop.create!(
    title: "Kit's Farewell",
    description: "Kit's got a new job. Time for an epic farewell.",
    total_time: 0,
    private: true,
    user_id: user1.id
)

w2 = Workshop.create!(
    title: "Consumer Showcase",
    description: "Time to show off our Squads work to the Tribe",
    total_time: 4000,
    private: false,
    user_id: user2.id
)

w3 = Workshop.create!(
    title: "Legal Training - 2020 [WIP]",
    description: "Mandatory Legal training - Still planning",
    total_time: 0,
    private: true,
    user_id: user2.id
)

puts "created #{Workshop.count} workshops called #{Workshop.pluck(:title).join(', ')}."

print "Creating tasks..."
Task.destroy_all

Task.create!(
    title: "Roast",
    description: "Time to roast Kit",
    time: 1200,
    tools: "Roast notes and timer",
    num_participants: 20,
    private: true,
    position: 0,
    user_id: user1.id,
    workshop_id: w1.id
)

Task.create!(
    title: "Toast",
    description: "Now we've torn Kit down let's build her up",
    time: 1200,
    tools: "Toast notes and timer",
    num_participants: 20,
    private: true,
    position: 1,
    user_id: user1.id,
    workshop_id: w1.id
)

Task.create!(
    title: "Party",
    description: "Time to party",
    time: 3000,
    tools: "A4 paper, Sharpies",
    num_participants: 10,
    private: true,
    position: 2,
    user_id: user1.id,
    workshop_id: w1.id
)

Task.create!(
    title: "Set tone",
    description: "Get everyone pumped and play music based on the showcase theme.",
    time: 300,
    tools: "Music, screen with speakers and laptop",
    num_participants: 120,
    private: false,
    position: 0,
    user_id: user2.id,
    workshop_id: w2.id
)

Task.create!(
    title: "GA Squad Presents",
    description: "Feature releases this month.",
    time: 300,
    tools: "Screen with speakers and timer",
    num_participants: 120,
    private: false,
    position: 1,
    user_id: user2.id,
    workshop_id: w2.id
)

Task.create!(
    title: "Origami Squad Presents",
    description: "Get everyone pumped and play music based on the showcase theme.",
    time: 300,
    tools: "Screen with speakers and timer",
    num_participants: 120,
    private: false,
    position: 2,
    user_id: user2.id,
    workshop_id: w2.id
)

Task.create!(
    title: "Wrap up",
    description: "Thank all the presenters and hand over hosting to next weeks MC",
    time: 300,
    tools: "Music and screen with speakers",
    num_participants: 120,
    private: false,
    position: 3,
    user_id: user2.id,
    workshop_id: w2.id
)

puts "created #{Task.count} tasks called #{Task.pluck(:title).join(', ')}."


# TEMPLATES ********************

# Retro
puts "Creating retro template"

retro_workshop = Workshop.create!(
    title: "Retro",
    description: "Improve teamwork by reflecting on what worked, what didn't and why.",
    total_time: 3600, # 1 hour
    private: false,
    user_id: nil # template
)

Task.create!(
    title: "Recall",
    description: "Briefly summarise the work and events since the last retro. This helps the team recall before they reflect.",
    time: 300,
    tools: "Whiteboard and whiteboard marker",
    num_participants: 10,
    private: false,
    position: 0,
    user_id: nil,
    workshop_id: retro_workshop.id
)

Task.create!(
    title: "Team recall",
    description: "Ask the team to fill in anything you may have missed when you summarised. This will help get the brain juices flowing.",
    time: 300,
    tools: "Post-its and sharpies",
    num_participants: 10,
    private: false,
    position: 1,
    user_id: nil,
    workshop_id: retro_workshop.id
)

Task.create!(
    title: "Reflect",
    description: "Write 'Start', 'Stop', 'Continue' and 'Shout out' on the whiteboard. Invite everyone to add atleast one post-it under each heading. They should think about what the team should start doing, stop doing, continue doing and anyone they want to give a shout out to.",
    time: 900,
    tools: "Whiteboard, whiteboard markers, post-its, sharpies and music to set the tone",
    num_participants: 10,
    private: false,
    position: 2,
    user_id: nil,
    workshop_id: retro_workshop.id
)

Task.create!(
    title: "Summarise",
    description: "Group the post-its around themes e.g. 'Team communication'",
    time: 300,
    tools: "Whiteboard, whiteboard markers, post-its, sharpies and music to set the tone",
    num_participants: 10,
    private: false,
    position: 3,
    user_id: nil,
    workshop_id: retro_workshop.id
)

Task.create!(
    title: "Vote",
    description: "Invite the team to vote on their top three themes they would like to discuss.",
    time: 120,
    tools: "Stickers and music",
    num_participants: 10,
    private: false,
    position: 4,
    user_id: nil,
    workshop_id: retro_workshop.id
)

Task.create!(
    title: "Discuss",
    description: "Starting with the highest voted themes, go through the themes one at a time and invite the team to discuss the topic. Note down an action for each topic and assign someone to complete it. Don't forget to celebrate the shout outs! ",
    time: 900,
    tools: nil,
    num_participants: 10,
    private: false,
    position: 5,
    user_id: nil,
    workshop_id: retro_workshop.id
)

puts "Retro template created"

# Sprint plan
puts "Creating sprint planning template"

sprint_plan = Workshop.create!(
    title: "Sprint plan",
    description: "Define what can be delivered in the sprint and how it will be achieved.",
    total_time: 3600, # 1 hour
    private: false,
    user_id: nil # template
)

Task.create!(
    title: "Objective",
    description: "Invite the Product Manager to describe the objective of the sprint and what backlog items will contribute to the goal.",
    time: 300,
    tools: "Sprint wall and backlog",
    num_participants: 20,
    private: false,
    position: 0,
    user_id: nil,
    workshop_id: sprint_plan.id
)

Task.create!(
    title: "Card breakdown",
    description: "Break down the sprint into achievable cards and add them to the backlog.",
    time: 300,
    tools: "Sprint wall and backlog",
    num_participants: 20,
    private: false,
    position: 1,
    user_id: nil,
    workshop_id: sprint_plan.id
)

Task.create!(
    title: "Prioritisation",
    description: "Review the cards as a team and prioritise them based on must have, should have, could have and won't have. Move the highest priority items to the sprint wall.",
    time: 300,
    tools: "Sprint wall and backlog",
    num_participants: 20,
    private: false,
    position: 2,
    user_id: nil,
    workshop_id: sprint_plan.id
)

Task.create!(
    title: "Assign pairs",
    description: "Ask the team to volunteer for the first card they want to pick up. Encourage them to work in pairs.",
    time: 300,
    tools: "Sprint wall and backlog",
    num_participants: 20,
    private: false,
    position: 3,
    user_id: nil,
    workshop_id: sprint_plan.id
)

Task.create!(
    title: "Get started",
    description: "Have a great sprint!",
    time: 300,
    tools: "Sprint wall and backlog",
    num_participants: 20,
    private: false,
    position: 4,
    user_id: nil,
    workshop_id: sprint_plan.id
)

puts "Sprint plan template created"

# Design review
puts "Creating design review template"

design_review = Workshop.create!(
    title: "Design Review",
    description: "Base template for 30/60/90 design reviews",
    total_time: 3600, # 1 hour
    private: false,
    user_id: nil # template
)

Task.create!(
    title: "Objective",
    description: "Invite the Product Manager to describe the objective of the work and relevant metrics.",
    time: 300,
    tools: "Project Brief",
    num_participants: 8,
    private: false,
    position: 0,
    user_id: nil,
    workshop_id: design_review.id
)

Task.create!(
    title: "Overview of work",
    description: "Walk through the work and outline what you would like feedback on.",
    time: 300,
    tools: "Designs or prototype",
    num_participants: 8,
    private: false,
    position: 1,
    user_id: nil,
    workshop_id: design_review.id
)

Task.create!(
    title: "Review",
    description: "Invite everyone to spend time adding comments to the design. Group the comments into themes as they are added.",
    time: 600,
    tools: "Post-its and sharpies",
    num_participants: 8,
    private: false,
    position: 2,
    user_id: nil,
    workshop_id: design_review.id
)

Task.create!(
    title: "Discussion",
    description: "Invite everyone to discuss the feedback one theme at a time and note any follow-up actions.",
    time: 600,
    tools: "Notepad and pen",
    num_participants: 8,
    private: false,
    position: 3,
    user_id: nil,
    workshop_id: design_review.id
)

Task.create!(
    title: "Wrap up",
    description: "Thank everyone for their input and tell them the plan for next steps.",
    time: 600,
    tools: "Wrap up music",
    num_participants: 8,
    private: false,
    position: 3,
    user_id: nil,
    workshop_id: design_review.id
)

puts "Sprint plan template created"