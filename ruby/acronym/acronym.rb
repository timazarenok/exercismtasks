=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.


To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym
    def self.abbreviate(name)
        name.split('-').join(' ').split(' ').map(&:chr).join('').upcase
    end
end

acron = Acronym.abbreviate("RUN  f-d ded");
puts acron