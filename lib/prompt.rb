# frozen_string_literal: true

# Class to prompt the user for input
class Prompt
  EXIT_COMMAND = 'exit'

  def initialize
    @history = [] # TODO: Need to only add to history if the command is successful
  end

  def ask(question)
    print "#{question} "
    input = gets.chomp
    @history << input

    input
  end

  def number(question, min:, max:)
    input = ask(question)

    until input.to_i.to_s == input && input.to_i >= min && input.to_i <= max
      input = ask("Please enter a number between #{min} and #{max}:")
    end

    input.to_i
  end

  def choose(question, options)
    puts question
    options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end

    input = number("Enter a number from 1 to #{options.size}", min: 1, max: options.size)

    options[input.to_i - 1]
  end

  def exit?
    @history.last == EXIT_COMMAND
  end
end
