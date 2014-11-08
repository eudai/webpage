
module Finder
	
	def element(name,selector)
		define_method name.to_s do
    		find selector
    	end
  	end

  	def elements(name,selector)
    	define_method name.to_s do
      		all selector
    	end
  	end

  	def section(name,class_name,selector)
    	define_method name.to_s do
      		eval(class_name.to_s).new find(selector), selector
    	end
  	end

  	def sections(name,class_name,selector)
    	define_method name.to_s do
      		eval(class_name.to_s).new all(selector), selector
    	end
  	end

end