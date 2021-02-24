#==== shift DB =====#
# shiftDB variables
# module with sfvar
# class
#===================#

class sfvar
	@name  : String
	@value : String


	def initialize(@name : String, @value : String)
	end


	def name : String
		@name
	end

	def val : String
		@value
	end
end
