# Seed data for Users
User.destroy_all

print "Creating users..."

user1 = User.create!(
    email: "a@b.com",
    password: 'yayaya',
    username: 'Aya'
)

User.create!(
    email: "b@c.com",
    password: 'yayaya',
    username: 'Yoyo'
)

puts "Created #{User.count} users."


print "Creating workshops..."
Workshop.destroy_all

Workshop.create!(
    title: "Retro",
    description: "This is a description of a retro",
    total_time: 0,
    private: false,
    user_id: user1.id
)

puts "created #{Workshop.count} workshops called #{Workshop.pluck(:title).join(', ')}."