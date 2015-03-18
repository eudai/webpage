
module Page

    def find(selector, type = :css)
        puts "searching for element with the ${type.to_s} of #{selector}...'"
        element = page.find_element type.to_sym, selector
        puts 'element found.'
        Element.new(element)
    end

    def all(selector, type = :css)
        puts "searching for elements with the #{type.to_s} of #{selector}..."
        elements_array = []
        elements = page.find_elements type.to_sym, selector
        elements.each do |e|
            elements_array << Element.new(e)
        end
        elements_array
    end

    def enter_frame(selector)
        puts "switching to frame with the '#{type}' of '#{selector}'..."
        page.switch_to.frame find selector
    end

    def leave_frame
        page.switch_to.default_content
    end

    def within_frame(selector)
        puts "swithing to frame: #{selector}"
        page.switch_to.frame selector
        yield
        puts 'returning to default content...'
        page.switch_to.default_content
    end

    def wait_until(timeout, delay = 0.1)
        t = Time.now + timeout
        while t > Time.now
            begin
                break if yield
            rescue
                sleep delay
            end
        end
    end

    def drag_and_drop(source,target)
        puts "dragging '#{source}' to '#{target}'..."
        page.action.click_and_hold(source)
        page.action.move_to(target)
        page.action.release
    end

    def click(element,x = 0,y = 0)
        puts "clicking element at #{x}, #{y}..."
        page.action.move_to(element,x,y).click.perform
    end

    def execute(javascript)
        puts 'executing javascript...'
        page.execute_script javascript
    end

    def action
        page.action
    end

    def browser
        page.browser
    end

    def page
        self
    end

    def click_in_element(e,x,y)
        action { move_to(e,x,y).click.perform }
    end

end
