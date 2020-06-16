#-------------------------------------------------------------------------------
# -- Class: HomePage
# -- Purpose: Holds page objects only for checkout process   
#-------------------------------------------------------------------------------

class HomePage
    def initialize(browser)
        require 'watir'
        require 'selenium-webdriver'
        Selenium::WebDriver::Chrome::Service.driver_path='C:/Users/kunaa/Desktop/chromedriver_win32/chromedriver_83.exe'
        @browser = Watir::Browser.new
    end
    def visit
        @browser.goto 'https://www.williams-sonoma.com/account/login.html'
    end
    def refresh 
        sleep 7
        @browser.refresh
    end
    # Login elements 
    def email
        @browser.text_field(:id=>'login-email')
    end
    def password
        @browser.text_field(:id=>'login-password')
    end
    def submit
        @browser.button(:xpath=>"//div[@class='button-group']//button[@id='btn-sign-in']")
    end
    # Home Page Elements
    def select_product_category(category)
        @browser.link(:xpath=>"//a[contains(@class,'topnav-#{category}')]")
    end
    def select_product_sub_category(sub_category)
        @browser.link(:text =>"#{sub_category}")
    end
    def select_product_from_grid(product_name)
        @browser.link(:text =>"#{product_name}")
    end
    def enter_quantity
        @browser.text_field(:xpath=>"//input[@placeholder='QTY']")
    end
    def product_amount
        @browser.element(:css=>'.price-amount')
    end
    def add_to_cart
        @browser.button(:id=>"primaryGroup_addToCart_0")
    end
    # Overlay
    def on_add_to_cart_overlay_visible
        @browser.div(:xpath=>"//div[@id='racOverlay']").wait_until(&:present?) ? (return true) : (return false)
    end
    def on_overlay_checkout_button_visible
        @browser.div(:id=>'btn-checkout').wait_until(&:present?) ? (return true) : (return false)
    end
    def overlay_button_checkout
        @browser.div(:id=>'btn-checkout')
    end
    
    # Checkout page elements
    def does_url_has(value)
        current_url = @browser.url
        (current_url.include? "#{value}")==true ? (return true) : (return current_url)

    end
    def product_name_from_checkout_page
        @browser.element(:css=>'.cart-table-row-title')
        
    end
    def quantity
        @browser.text_field(:xpath=>"//input[@id='updates[0].quantity']")
    end
    def product_amount
        @browser.element(:css=>'.price-amount')
    end

    # Search
    def search_product(search_value)
        @browser.text_field(:id=>'search-field').send_keys(search_value)
        @browser.link(:id=>'btnSearch').click
    end
    # QuickLook
    def get_quicklook_element 
       @browser.span(:xpath => "//li[1]//div[2]//quick-look[1]//div[1]//a[1]//span[1]")
    end
    def quicklook_product_name(search_p_name)
        @browser.element(:xpath=>"//h1[contains(text(),'#{search_p_name}')]").text
    end
    def quicklook_product_amount
        @browser.element(:xpath=>"//div[@class='subset-pricing subsetPricing']//span[@class='price-state price-standard']").text
    end

    # Search results
    def get_product_name
        @browser.link(:css=>'.product-name').wait_until(&:present?).text
    end
    def get_product_amount
        @browser.element(:xpath=>"//body[@id='searchresults']/div[@id='search']/main/search-results/div[@id='results-wrapper']/div[@id='content']/div[@id='search-tiles']/ul[@class='shop-list product-list']/li[1]/div[2]/span[1]").text
    end

end