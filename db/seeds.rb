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
    title: "Retro",
    description: "This is a description of a retro",
    total_time: 0,
    private: false,
    user_id: user1.id
)

w2 = Workshop.create!(
    title: "Discovery Kick Off",
    description: "This is a description of a kick off",
    total_time: 4000,
    private: false,
    user_id: nil
)

w3 = Workshop.create!(
    title: "Showcase",
    description: "This is a description of a kick off",
    total_time: 0,
    private: true,
    user_id: user2.id
)

    Workshop.create!(
    title: "Text",
    description: "Testing heroku",
    total_time: 0,
    private: false,
    user_id: nil
)

puts "created #{Workshop.count} workshops called #{Workshop.pluck(:title).join(', ')}."

print "Creating tasks..."
Task.destroy_all

t1 = Task.create!(
    title: "Lightning talks",
    description: "This is a description of a lightning talks",
    time: 0,
    tools: "Post-its, Sharpies",
    num_participants: 10,
    private: false,
    user_id: user1.id
)

t2 = Task.create!(
    title: "Crazy 8s",
    description: "This is a description of a crazy eights",
    time: 0,
    tools: "A4 paper, Sharpies",
    num_participants: 10,
    private: false,
    user_id: nil
)

t3 = Task.create!(
    title: "Bananas",
    description: "This is a description of going bananans",
    time: 80000,
    tools: "A4 paper, Sharpies",
    num_participants: 10,
    private: false,
    user_id: nil
)

puts "created #{Task.count} tasks called #{Task.pluck(:title).join(', ')}."

puts "Tasks >-< Workshops"

w1.tasks << t1 << t2
w2.tasks << t2

puts "Workshop #{w1.title} has tasks #{w1.tasks.pluck(:title).join(', ')}"
puts "Workshop #{w2.title} has tasks #{w2.tasks.pluck(:title).join(', ')}"

t3.workshops << w2

puts "Task #{t3.title} has workshops #{t3.workshops.pluck(:title).join(', ')}"


