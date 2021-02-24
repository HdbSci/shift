#==== shift DB =====#
# Database engine
# module with sfdb
# class
#===================#

require "./sfvar"


class Sfdb
    @dbid : Int32
    @data : Hash(String, Sfvar)


    def initialize(@dbid : Int32)
        @data = Hash(String, Sfvar).new
    end


    def eval(code : String)
        tk = code.split(" ").map {|item| item.strip}

        command = tk[0]
    
        case command.upcase
        when "SET"
            key = tk[1]
            val = tk[2]

            @data[key] = Sfvar.new val
            @data[key].set_name key

        when "READ"
            key = tk[1]
            puts @data[key].val

        when "EXIT"
            exit

        else
            puts "SyntaxError: #{command} is not a valid command"
        end
    end
end