
class Element

    def initialize(element)
        @element = element
    end

    def attribute(name)
        @element.attribute name
    end

    def clear
        puts 'clearing element...'
        @element.clear
    end

    def click
        puts 'clicking element...'
        @element.click
    end

    def css_value(prop)
        @element.css_value prop
    end

    def displayed?
        @element.displayed?
    end

    def enabled?
        @element.enabled?
    end

    def hash
        @element.hash
    end

    def inspect
        @element.inspect
    end

    def location
        @element.location
    end

    def location_once_scrolled_into_view
        @element.location_once_scrolled_into_view
    end

    def selected?
        @element.selected?
    end

    def send_keys(args)
        puts 'sending keys to element...'
        @element.send_keys args
    end

    def size
        @element.size
    end

    def submit
        puts 'submitting...'
        @element.submit
    end

    def tag_name
        @element.tag_name
    end

    def text
        @element.text
    end

    def to_json(args)
        @element.to_json(args)
    end

    # End of default selenium element methods

    def native
        @element
    end

    def find(selector, type = :css)
        puts "searching for element with the #{type} of #{selector}..."
        element = @element.native.find_element type, selector
        puts 'element found.'
        Element.new(element)
    end

    def all(selector, type = :css)
        puts "searching for elements with the #{type} of #{selector}..."
        elements_array = []
        elements = @element.native.find_elements type.to_sym, selector
        elements.each {|e|elements_array << Element.new(e,selector)}
        puts "#{elements.size} elements found."
        elements_array
    end

    def exists?
        @element ? true : false
    end

    def set(text)
        puts 'setting the text of element...'
        @element.clear
        @element.send_keys text
    end

    def send(keys)
        puts 'sending keys to element...'
        @element.send_keys keys
    end

    def visible?
        @element.displayed?
    end

    def click_at(x,y)
        page.action.move_to(@element,x,y).click.perform
    end

    def selector
        @element.tag_name
    end

    def value
        @element.attribute 'value'
    end

    def selector
        @selector
    end

    def [](attribute)
        @element.attribute attribute
    end 
    
end