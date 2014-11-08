
class Element

	def initialize(element,selector)
		@selector = selector
		@element = element
	end

	def attribute(name)
		@element.attribute name
	end

	def clear
		@element.clear
	end

	def click
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
		@element.send_keys args
	end

	def size
		@element.size
	end

	def submit
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

	def find(selector, type = :css)
	    begin
	      element = @element.find_element type.to_s, selector
	    rescue => e
	      puts e
	      false
	    else
	      Element.new(element,selector)
	    end
	end

	def all(selector, type = :css)
	    elements_array = []
	    begin
	    	elements = @element.find_elements type.to_sym, selector
	    rescue
	    	puts "failed to find any elements with the #{type.to_s} of #{selector}"
	    else
	    	elements.each {|e|elements_array << Element.new(e,selector)}
	    end
	    elements_array
	end

	def section(name, class_name, selector)
	    define_method name.to_s do
	      	class_name.new(find selector,selector)
	    end
	end

	def exists?
		@element ? true : false
	end

	def set(text)
		@element.clear
		@element.send_keys text
	end

	def send(keys)
		@element.send_keys keys
	end

	def visible?
		@element.displayed?
	end

	def click_at(x,y)
		page.action.move_to(@element,x,y).click.perform
	end

	def selector
		@element.attribute 'css'
	end

	def value
		@element.attribute 'value'
	end

	def class
		@element.attribute 'class'
	end

	def selector
		@selector
	end

	def [](attribute)
		@element.attribute attribute
	end	

	def native
		@element
	end
	
end