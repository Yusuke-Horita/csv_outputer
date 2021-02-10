# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
	name = Faker::Name.name
	email = Faker::Internet.email
	phone_number = Faker::PhoneNumber.cell_phone
	postal_code = Faker::Address.postcode
	address = Faker::Address.full_address
	User.create!(
		name: name,
		email: email,
		phone_number: phone_number,
		postal_code: postal_code,
		address: address
	)
end