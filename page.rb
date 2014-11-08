
module Page

    def find(selector, type = :css)
        puts "searching for the element with the '#{type}' of '#{selector}'..."
        begin
            element = @webpage.find_element type.to_sym, selector
        rescue => e
            puts "failed to find element with the #{type.to_s} of #{selector}"
            raise RuntimeError, "failed to find element with the #{type.to_s} of #{selector}"
        else
            puts "element found." 
            Element.new(element,selector)
        end
    end

    def all(selector, type = :css)
        elements_array = []
        begin
            elements = @webpage.find_elements type.to_sym, selector
        rescue
            puts "failed to find any elements with the #{type.to_s} of #{selector}"
        else
            elements.each do |e|
                elements_array << Element.new(e, selector)
            end
        end
        elements_array
    end

    def enter_frame(selector)
        puts "switching to frame with the '#{type}' of '#{selector}'..."
        @webpage.switch_to.frame find selector
    end

    def leave_frame
        @webpage.switch_to.default_content
    end

    def within_frame(selector)
        puts 'swithing to frame: ' + selector
        @webpage.switch_to.frame selector
        yield
        puts 'returning to default content...'
        @webpage.switch_to.default_content
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
        @webpage.action.click_and_hold(source)
        @webpage.action.move_to(target)
        @webpage.action.release
    end

    def click(element,x = 0,y = 0)
        puts "clicking element at #{x}, #{y}..."
        @webpage.action.move_to(element,x,y).click.perform
    end

    def execute(javascript)
        puts 'executing javascript...'
        @webpage.execute_script javascript
    end



    def action
        a = @webpage.action
        a << yield
        a.perform
    end

    def page
        self
    end

    def click_in_element(e,x,y)
        action { move_to(e,x,y).click.perform }
    end
end