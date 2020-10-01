=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

WEEKENDS = {:monday => 1, :tuesday => 2, :wednesday => 3, :thursday => 4, :friday => 5, :saturday => 6, :sunday => 7};
POSITION = [:first, :second, :third, :fourth, :fifth, :last, :monteenth, :tuesteenth, :wednesteenth, :thursteenth, :friteenth, :saturteenth, :sunteenth]

class Meetup
    def initialize(month, year)
        @date = Date.new(year, month)
    end
    def day(weekd, pos)
        @date.cwday = WEEKENDS[weekd]
        
    end
    def meetup

    end
end

meetup = Meetup.new(5, 2013).day(:monday, :teenth)
