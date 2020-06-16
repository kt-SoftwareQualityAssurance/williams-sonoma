Given('I am on home page and logged in') do
    @home_page = HomePage.new(@browser)
    @home_page.visit
    @home_page.refresh
    @home_page.email.send_keys("qa_test_assignment@gmail.com")
    @home_page.password.send_keys("&$5aPhD?SLnbnnH")
    @home_page.submit.click
    sleep 2
end  
When('I go to product {string} category') do |category|
    @home_page.select_product_category(category).hover
end
Then('I select {string} from sub category') do |sub_category|
    @home_page.select_product_sub_category(sub_category).click
end
Then('I select {string} product from grid') do |product_name|
    @home_page.select_product_from_grid(product_name).click
end
And('I enter the required quantity {string} to buy product') do |quantity|
    @home_page.enter_quantity.to_subtype.clear
    @home_page.enter_quantity.send_keys(quantity)
end
And('I see the total cost of product') do
    @product_amount = @home_page.product_amount.text
end
And('I add the product to cart') do
    @home_page.add_to_cart.click
end
And('Confirm checkout overlay shows up and has checkout button') do
    raise("Checkout Overlay is not visible") unless @home_page.on_add_to_cart_overlay_visible==true
    raise("On Overlay checkout button not visible") unless @home_page.on_overlay_checkout_button_visible==true
end
And('I click on checkout and takes me on checkout page') do 
    sleep 2
    @home_page.overlay_button_checkout.click
end
And('Confirm I am navigated to shopping cart page') do
    url = "shoppingcart"
    raise("URL navigation failed, Expected:shoppingcart Actual: #{@home_page.does_url_has(url)}") unless @home_page.does_url_has(url)==true
end
Then('confirm product name {string} and amount is correct') do |product_name|
    sleep 2
    raise("Product Name comparison failed Expected #{product_name} Actual:#{@home_page.product_name_from_checkout_page.text}") unless product_name == @home_page.product_name_from_checkout_page.text
    raise("Product Amount comparison failed Expected #{@product_amount} Actual:#{@home_page.product_amount.text}") unless @product_amount == @home_page.product_amount.text
end
And('I search for a product {string}') do |search_product|
    @home_page.search_product(search_product)
end

And('I fetch the product name and amount') do
     @search_p_amount = @home_page.get_product_amount
end
And('I click on quicklook button') do
    @home_page.get_quicklook_element.click
end
Then('compare {string} name and amount with overlay details') do |input_p_name|
    quicklook_p_name = @home_page.quicklook_product_name(input_p_name)
    quicklook_p_amount = @home_page.quicklook_product_amount
    raise("QuickLook - Product name mismatch") unless input_p_name==quicklook_p_name
    raise("QuickLook - Product Amount mismatch") unless @search_p_amount==quicklook_p_amount
end