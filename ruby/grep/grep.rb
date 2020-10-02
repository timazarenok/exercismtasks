=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

require 'io/console'

class Grep
    def initialize
        @result = []
    end
    def grep(pattern, flags, files)
        @flags = flags
        @pattern = pattern
    end
    def no_flags(files)
        files.each do |file| IO.readlines(file).each_with_index do |string|
             if string.match(/#{@pattern}/)
                @result.push(string)
             end
            end
        end
    end
end

pattern = "tima"
files = ["test.txt"]
flags = []

g = Grep.new()
p g.no_flags(files)