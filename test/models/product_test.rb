require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	test "product attributes must not be empty" do 
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:image_url].any?
		assert product.errors[:price].any?
	end
	test "product price shold not be negative" do 
		product = Product.new(title: "Book",
						description:"FuzzBuzz",
						image_url:"FuzzBuzz.gif")
		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
			product.errors[:price]	
	end
	test "product price must not be zero" do 
		product = Product.new(title: "Book",
						description:"FuzzBuzz",
						image_url:"FuzzBuzz.gif")	
		product.price = 0
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
			product.errors[:price]		
	end

	test "product is not valid with unique title" do
		product = Product.new(title: products(:ruby).title, description:"FuzzBuzz",
						image_url:"FuzzBuzz.gif", price: 10)
		assert product.invalid?
		assert_equal [I18n.translate('activerecord.errors.messages.taken')],
			product.errors[:title]
	end
end
