#==== shift DB =====#
# Main file, runs the
# database locally or
# as a server
#===================#

require "socket"
require "option_parser"

require "./shiftdb"


shift_version = "v1.0.0"  #version


OptionParser.parse do |parser|
    parser.banner = "Welcome to The Beatles App!"

    parser.on "repl", "Start the shift repl" do
        database = Sfdb.new 0x00  #with code 0x00 because is main

        puts "shiftDB #{shift_version} made by HdbSci"
        puts ""

        loop do
            print "shift@#{shift_version}> "
            cmd = gets.not_nil!
            database.eval cmd
        end
    end

    parser.on "serve", "Start the shift server" do
        server = TCPServer.new("localhost", 5000)
        database = Sfdb.new 0x00  #with code 0x00 because is main

        server.recv_buffer_size = 4096

        loop do
            socket = server.accept
            if socket
                spawn do
                    loop do
                        if request = socket.gets
                            database.eval request
                        end
                    end
                end
            end
        end
    end

    parser.on "-v", "--version", "Show version" do
        puts "shift NoSQL database #{shift_version}"
        exit
    end

    parser.on "-h", "--help", "Show help" do
        puts parser
        exit
    end
end