# frozen_string_literal: true

# Write your code for the 'Grep' exercise in this file. Make the tests in
# `grep_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/grep` directory.

require_relative('flags.rb')

class Grep < Flags
  def self.grep(pattern, flags, files)
    result = Flags.new(flags, files).grep(pattern).join.strip
  end
end

pattern = 'OF ATREUS, Agamemnon, KIng of MEN.'
flags = ['-n', '-i', '-x']
files = ['test.txt']

p Grep.grep(pattern, flags, files)
