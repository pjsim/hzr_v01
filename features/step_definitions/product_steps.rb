### UTILITY METHODS ###

def create_unsaved_product
  @unsaved_product ||= { :name => "Grand Piano", :price => 1000.00, 
  	:description => "It's a very big piano"}
end

def create_product
  create_unsaved_product
  delete_product
  @product = FactoryGirl.create(:product, @unsaved_product)
end

def delete_product
  @product ||= Product.where(:name => @unsaved_product[:name]).first
  @product.destroy unless @product.nil?
end

def create_product_form
  #delete_product
  create_unsaved_product
  visit '/products/new'
  fill_in "product_name", :with => @unsaved_product[:name]
  fill_in "product_price", :with => @unsaved_product[:price]
  fill_in "product_description", :with => @unsaved_product[:description]
  click_button "Create Product"
end

#WHEN
When(/^I create a product with valid data$/) do
  create_product_form
end

#THEN
Then(/^I should see a successful listing message$/) do
  page.should have_content "Product was successfully created."
end