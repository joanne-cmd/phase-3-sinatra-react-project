
puts "🌱 Seeding spices..."

# Seed your database here

# create user instance
50.times do
    User.create(
        fullname: Faker::Name.name,
        email: Faker::Internet.email,
        phonenumber: Faker::Number.number
    )
end
# create item instance

CATEGORY = [:cleaning, :Drinks, :Meats, :Meals, :Dairy, :Fruits, :Vegetables, :Hygiene, :Groceries, :Bakery, :Health, :Beauty]

50.times do
    category = CATEGORY.sample 
    Item.create(
        name: Faker::Name.name,
        image_url: "https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529__340.jpg",
        description: Faker::Lorem.paragraph,
        category: category,
        user_id: rand(User.first.id..User.last.id),
        
    )
end

puts "✅ Done seeding!"
