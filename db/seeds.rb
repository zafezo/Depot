# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
10.times{
Product.create!(title: 'Programing Ruby on Rails',
			description:%{<p>It is a new book about Ruby on Rails 
				Programing</p>},
			image_url: 'ruby.png',
			price: 45.6)
}