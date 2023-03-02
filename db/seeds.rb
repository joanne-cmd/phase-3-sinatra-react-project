
puts "🌱 Seeding spices..."

# Seed your database here
# create category instance
12.times do
    Category.create(name: Faker::Name.name)
end
# create user instance
12.times do
    User.create(
        fullname: Faker::Name.name,
        email: Faker::Internet.email,
        phonenumber: Faker::Number.number
    )
end
# create item instance
12.times do
    Item.create(
        name: Faker::Name.name,
        image_url: "https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529__340.jpg",
        description: Faker::Lorem.paragraph,
        user_id: rand(User.first.id..User.last.id),
        category_id: rand(Category.first.id..Category.last.id)

    )
end

puts "✅ Done seeding!"
