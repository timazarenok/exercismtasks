=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end


class Queens
    def initialize(args)
        @white = args[:white]
        @black = args[:black]
        on_desk
    end 

    def on_desk
        raise ArgumentError.new if (@white[0] > 8 && @white[0] <= 0) && (@white[1] > 8 && @white[1] <= 0)
    end

    def attack?
        row? || column? || diog?
    end

    def row?
        @white[0] == @black[0]
    end

    def column?
        @white[1] == @black[1]
    end

    def diog?
        @white[0] == @white[1] && @black[0] == @black[1]
    end
end

p queens = Queens.new(white: [7,5])