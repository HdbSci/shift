#==== shift DB =====#
# shiftDB variables
# module with sfvar
# class
#===================#

class Sfvar
	@name  : String
	@value : String


	def initialize(@value : String)
		@name = ""
	end


	def set_name(name : String)
		@name = name
	end

	def name : String
		@name
	end

	def val : String
		@value
	end
end
