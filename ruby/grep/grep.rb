# frozen_string_literal: true

# Write your code for the 'Grep' exercise in this file. Make the tests in
# `grep_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/grep` directory.

require 'io/console'

class Grep
  def initialize(pattern, flags, files)
    @pattern = pattern
    @flags = flags
    @files = files
  end

  def self.grep(pattern, flags, files)
    Grep.new(pattern, flags, files).grep
  end

  def grep
    create_pattern
    f
  end

  private

  def f
    combine_files.map { |f_name, lines| check_flags(f_name, lines) }.compact.join("\n").strip
  end

  def combine_files
  @files.each_with_object({}) do |f_name, lines|
      lines[f_name] = get_lines(f_name)
    end
  end

  def get_lines(f_name)
    file = File.open(f_name)
    file.readlines.map(&:chomp)
  end

  def check_flags(file, lines)
    return l_flag(file, lines) if @flags.include?('-l')

    lines.each_with_index.map do |line, index|
      "#{multi_files(file)}#{need_index(index)}#{line}" if v_match(line)
    end.compact.join("\n")
  end

  def create_pattern
    i = @flags.include?('-i') ? Regexp::IGNORECASE : false
    x = @flags.include?('-x') ? "^#{@pattern}$" : @pattern
    @pattern = Regexp.new(x, i)
  end

  def need_index(index)
    @flags.include?('-n') ? "#{index + 1}:" : ''
  end

  def multi_files(file)
    @files.size > 1 ? "#{file}:" : ''
  end

  def v_match(string)
    @flags.include?('-v') ? !string.match(@pattern) : string.match(@pattern)
  end

  def l_flag(file, lines)
    lines.any? { |line| v_match(line) } ? file : nil
  end
end

pattern = 'Agamemnon'
flags = ['-l']
files = ['test.txt', 'test1.txt', 'text.txt']
puts Grep.grep(pattern, flags, files)
