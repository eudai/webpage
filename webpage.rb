
root = File.expand_path('..', __FILE__)

load root + '/browser.rb'
load root + '/element.rb'
load root + '/finder.rb'
load root + '/page.rb'
load root + '/section.rb'

include Finder

class Webpage

	include Browser
	include Page

	def initialize(browser = :chrome)
		unless $webpage
			puts "launching webdriver for #{browser.to_s}..."
			$webpage = Selenium::WebDriver.for browser.to_sym
			puts "webdriver loaded."
		end
	end

	def page
		$webpage
	end

end

