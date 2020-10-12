=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

require_relative('flags.rb')

class Grep < Flags
  def self.grep(pattern, flags, files)
    result = Flags.new(flags).grep(pattern, files).join().strip
  end

end

pattern = "hello"
flags = ["-l", "-n"]
files = ["test.txt"]

Grep.grep(pattern, flags, files)