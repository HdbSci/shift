#==== shift DB =====#
# Main file, runs the
# database locally or
# as a server
#===================#

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

    parser.on "-v", "--version", "Show version" do
        puts "shift NoSQL database #{shift_version}"
        exit
    end

    parser.on "-h", "--help", "Show help" do
        puts parser
        exit
    end
end