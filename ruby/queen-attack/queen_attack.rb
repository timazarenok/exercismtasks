=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end


class Queens
    def initialize(white: nil, black: nil)
        @white = white
        @black = black
        raise ArgumentError if on_desk?(@white)
    end 

    def attack?
        row? || column? || diog?
    end

    private 

    def on_desk?(queen)
        return true if queen.nil?
        (queen[0] > 7 || queen[0] <= 0) || (queen[1] > 7 || queen[1] <= 0)
    end

    def row?
        @white[0] == @black[0]
    end

    def column?
        @white[1] == @black[1]
    end

    def diog?
        (@white[0] - @black[0]).abs == (@black[1] - @white[1]).abs
    end
end

p Queens.new(white: [8,4])