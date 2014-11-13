
module Browser

    def visit(url)
        url = 'https://' + url unless url.include? 'http'
        puts "visiting '#{url}'..."
        page.navigate.to url unless current_url == url
    end

    def current_url
        page.current_url
    end

    def refresh
        puts 'refreshing page...'
        page.navigate.refresh
    end

    def back
        puts 'navigating back...'
        page.navigate.back
    end

    def forward
        puts 'navigating forward...'
        page.navigate.forward
    end

    def maximize
        puts 'maximizing window...'
        page.manage.window.maximize
    end

    def move(x,y)
        puts "moving window to '#{x}, #{y}'..."
        page.manage.window.move_to x, y
    end

    def resize(width,height)
        puts "resizing window to '#{width}, #{height}'..."
        page.manage.window.resize_to(width,height)
    end

    def screenshot(filename)
        puts "saving screenshot to '#{filename}'..."
        page.save_screenshot(filename)
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
    end

    def alert
        page.switch_to.alert
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
        page.quit
    end

    def delete_cookie(name)
        @webpage.manage.delete_cookie name
    end

    def delete_all_cookies
        @webpage.manage.delete_all_cookies
    end

end