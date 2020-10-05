=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

require 'date'

WEEKENDS = {:monday => 1, :tuesday => 2, :wednesday => 3, :thursday => 4, :friday => 5, :saturday => 6, :sunday => 7};
POSITION = {:first => 0, :second => 1, :third => 2, :fourth => 3, :fifth => 4, :last => -1, :teenth => (12..19).to_a}

class Meetup
    def initialize(month, year)
        @year = year
        @month = month
        @date = Date.new(@year, @month, 1)
    end
    def day(weekd, pos)
        if(pos == :teenth)
            @date = Date.new(@year, @month, 13).step(Date.new(@year, @month, 19)).find {|d| d.cwday == WEEKENDS[weekd]}
        else
            @date = @date.step(Date.new(@year, @month, -1)).select {|d| d.cwday == WEEKENDS[weekd]}[POSITION[pos]]
        end
    end
end

p m = Meetup.new(9, 2013).day(:thursday, :teenth)