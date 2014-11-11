
module Finder
	
    def element(name,selector = nil)
		define_method name.to_s do
    		find selector
    	end
        define_method "has_#{name.to_s}?" do
            begin
                find selector
            rescue
                false
            end
        end
  	end

  	def elements(name,selector = nil)
    	define_method name.to_s do
            all selector
    	end
        define_method "has_#{name.to_s}?" do
            begin
                find selector
            rescue
                false
            end
        end
  	end

  	def section(name,class_name = nil,selector = nil)
    	define_method name.to_s do
            eval(class_name.to_s).new find(selector)
    	end
        define_method "has_#{name.to_s}?" do
            begin
                find selector
            rescue
                false
            end
        end
  	end

  	def sections(name,class_name = nil,selector = nil)
    	define_method name.to_s do
            eval(class_name.to_s).new all(selector)
    	end
        define_method "has_#{name.to_s}?" do
            begin
                find selector
            rescue
                false
            end
        end
  	end

end