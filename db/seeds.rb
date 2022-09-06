require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding database..."

# Create 2 users
first_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 123456, password_confirmation: 123456)
second_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 123456, password_confirmation: 123456)

# Create 11 groups
Group.create(user_id: first_user.id, name: "Housing", icon: "house")
Group.create(user_id: first_user.id, name: "Transportation", icon: "directions_car")
Group.create(user_id: first_user.id, name: "Food", icon: "restaurant")
Group.create(user_id: first_user.id, name: "Utilities", icon: "lightbulb")
Group.create(user_id: first_user.id, name: "Insurance", icon: "emergency")
Group.create(user_id: second_user.id, name: "Medical & Healthcare", icon: "local_hospital")
Group.create(user_id: second_user.id, name: "Saving, Investing, & Debt Payments", icon: "attach_money")
Group.create(user_id: second_user.id, name: "Personal Spending", icon: "shopping_cart")
Group.create(user_id: second_user.id, name: "Recreation & Entertainment", icon: "sports_esports")
Group.create(user_id: second_user.id, name: "Education", icon: "school")
Group.create(user_id: second_user.id, name: "Miscellaneous", icon: "more_horiz")

# Create 200 budgets
100.times do
  Budget.create(user_id: first_user.id, name: Faker::Commerce.unique.department, amount: Faker::Commerce.price)
end

100.times do
  Budget.create(user_id: second_user.id, name: Faker::Commerce.unique.department, amount: Faker::Commerce.price)
end

# Create 200 group_budgets
100.times do
  GroupBudget.create(group_id: Faker::Number.between(from: 1, to: 5), budget_id: Faker::Number.between(from: 1, to: 100))
end

100.times do
  GroupBudget.create(group_id: Faker::Number.between(from: 6, to: 11), budget_id: Faker::Number.between(from: 101, to: 200))
end

p "Seeding complete!"

p "Created #{User.count} users"
p "Created #{Group.count} groups"
p "Created #{Budget.count} budgets"
p "Created #{GroupBudget.count} group_budgets"