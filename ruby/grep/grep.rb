=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end


class Grep
    def initialize
        @result = []
    end
    def grep(pattern, flags, files)
        @flags = flags
        @pattern = pattern
        if flags.size == 0 
            files.each do |file| IO.readlines(file).each_with_index do |string|
                @result.push(string.match("/#{pattern}/"))
            
    end
    def (pattern, line, string)
        @flags.includes?('-i')
    end
    def n_l_flags?(file, number, string)
        @flags.includes?('-l') ? @result.push(file) : @flags.includes?('-n') ? @result.push("#{number}:#{string}") : @result
    end
end

pattern = ""
files = ["test.txt"]
flags = []