# frozen_string_literal: true

# This class is responsible for the main loop of the application
class CLI
  def initialize
    @prompt = Prompt.new
    @cart = Cart.new
    @running = true
  end

  def running?
    @running
  end

  def stop
    @running = false
  end
end
