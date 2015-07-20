# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
20.times{
	  title  = Faker::Lorem.sentence(3)
    description = Faker::Lorem.paragraph(4, false, 6)    
    price = Faker::Commerce.price
Product.create!(title: title,
			description:description,
			image_url: 'ruby.png',
			price: price)
}
