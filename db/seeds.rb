3.times do
  user = User.new(
    username: Faker::Lorem.characters(6),
    password: Faker::Lorem.characters(10)
    )
  user.save!
end
users = User.all

puts "3 users created"
