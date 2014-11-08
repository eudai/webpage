
require 'selenium-webdriver'
require './browser'
require './element'
require './page'
require './section'
require './finder'

include Finder

class Webpage

	include Browser
	include Page

	def initialize(browser = :chrome)
		puts "launching webdriver for #{browser.to_s}..."
		@webpage = Selenium::WebDriver.for browser.to_sym
	end

end

