# Seed data for Users
User.destroy_all

print "Creating users"

User.create!(
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
