
module Browser

	def visit(url)
    	puts "visiting '#{url}'..."
    	url = 'https://' + url unless url.include? 'http'
    	@webpage.navigate.to url unless current_url == url
  	end

  	def current_url
  		puts "current url is #{@webpage.current_url}"
    	@webpage.current_url
  	end

	def refresh
		puts 'refreshing page...'
    	@webpage.navigate.refresh
  	end

  	def back
  		puts 'navigating back...'
    	@webpage.navigate.back
  	end

  	def forward
  		puts 'navigating forward...'
    	@webpage.navigate.forward
  	end

  	def maximize
    	puts 'maximizing window...'
    	@webpage.manage.window.maximize
  	end

	def move(x,y)
	    puts "moving window to '#{x}, #{y}'..."
	    @webpage.manage.window.move_to x, y
	end

  	def resize(width,height)
    	puts "resizing window to '#{width}, #{height}'..."
    	@webpage.manage.window.resize_to(width,height)
  	end

  	def screenshot(filename)
        puts "saving screenshot to '#{filename}'..."
        @webpage.save_screenshot(filename)
    end

  	def new_tab
  		puts 'opening new tab...'
  	end

  	def close_tab(index)
  		puts "closing tab #{index.to_s}..."
  	end

  	def close_tab_titled(title)
  		puts "closing tab tited #{title}..."
  	end

  	def switch_to_tab(index)
  		puts "switching to tab #{index}..."
  	end

  	def switch_to_tab_titled(title)
  		puts "switching to tab titled #{title}..."
  		pending
  	end

  	def alert
        @webpage.switch_to.alert
    end

    def alert_text
        alert.text
    end

    def close_alert
        puts 'closing alert...'
        alert.accept
    end

    def quit
		puts 'closing webdriver...'
		@webpage.quit
	end
end