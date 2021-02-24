#==== shift DB =====#
# Database engine
# module with sfdb
# class
#===================#

require "./sfvar"


class sfdb
    @dbid : Int32
    @data


    def initialize(@dbid: Int32)
        @data = Hash(String, sfvar)
    end


    def eval(code : String)
        tk = code.split(" ").map {
            |item| item.strip
        }

        command = tk[0]
    
        case command.upcase
        when "SET"
            key = tk[1]
            val = tk[2]

            @data[key] = sfvar.new key val

        when "READ"
            key = tk[1]
            puts @data[key].val

        else
            puts "SyntaxError: #{command} is not a valid command"
        end
    end
end