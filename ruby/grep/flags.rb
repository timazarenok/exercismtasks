# frozen_string_literal: true

require 'io/console'

class Flags
  def initialize(flags, files)
    @result = []
    @flags = flags
    @files = files
  end

  def grep(str)
    pattern = create_pattern(str)
    @flags.include?('-v') ? v_flag(pattern) : f(pattern)
    
    @flags.include?('-l') && @result.length > 1 ? @result.uniq : @result
  end

  private

  def f(pattern)
    @files.each do |file|
      IO.readlines(file).each_with_index do |string, index|
        @result.push(check_flags(file, string, index)) if string.match(pattern)
      end
    end
  end

  def v_flag(pattern)
    @files.each do |file|
      IO.readlines(file).each_with_index do |string, index|
        @result.push(check_flags(file, string, index)) unless string.match(pattern)
      end
    end
  end

  def check_flags(file, string, index)
    n = @flags.include?('-n') ? "#{index + 1}:" : ''
    l = @flags.include?('-l') ? "#{file}:" : ''
    return "#{l.chop}\n" if @flags.include?('-l')

    if @files.length > 1
      "#{file}:#{n}#{string}"
    else
      "#{n}#{string}"
    end
  end

  def create_pattern(str)
    i = @flags.include?('-i') ? Regexp::IGNORECASE : false
    x = @flags.include?('-x') ? "^#{str}$" : str
    pattern = Regexp.new(x, i)
  end
end