require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products

	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end
	
	
	test "product price must be positive" do
		product = Product.new(title: "My Book Title",
		description: "yyy",
		image_url: "zzz.jpg")
		product.price = -1
		assert product.invalid?
		assert_equal "must be greater than or equal to 0.01",
		product.errors[:price].join('; ')
		product.price = 0
		assert product.invalid?
		assert_equal "must be greater than or equal to 0.01",
		product.errors[:price].join('; ')
		product.price = 1
		assert product.valid?
	end
	
	
	def new_product(image_url)
		Product.new(title: "My Book Title",
		description: "yyy",
		price: 1,
		image_url: image_url)
	end
	test "image url" do
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
		http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }
		ok.each do |name|
			assert new_product(name).valid?, "#{name} shouldn't be invalid"
		end
		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end
	end
	
	test "product is not valid without a unique title" do
		product = Product.new(title: products(:ruby).title,
		description: "yyy",
		price: 1,
		image_url: "fred.gif")
		assert !product.save
		assert_equal "has already been taken", product.errors[:title].join('; ')
	end
	
	test "no name" do	
		product = Product.new(description:"hi",price:1,image_url:"hi.gif")
		assert !product.save
	end
	
	test "no description" do	
		product = Product.new(title: "hi",price: 1,image_url: "hi.gif")
		assert !product.save
	end
	
	test "no img" do	
		product = Product.new(title:"hi",description:"hi",price:1)
		assert !product.save
	end
	test "price to big" do
		product = Product.new(title:"hi",description:"hi", image_url: "hi.gif", price: 100000.00)
		assert !product.save
		
		product2 = Product.new(title:"hi2",description:"hi2", image_url: "hi.gif", price: 99999.99)
		assert product2.save
		
	end
		
		
	
	
end
