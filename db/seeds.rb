# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creating Members

25.times do
  Member.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    contact_number: rand(10 ** 10)
  )
end

# Creating Matches
1000.times do
  begin
    Match.create(
      location: Faker::Nation.capital_city,
      winner_id: rand(1..25),
      looser_id: rand(1..25),
      winner_points: rand(0..1000),
      looser_points: rand(0..1000)
    )
  rescue => e
    p e
  end
end