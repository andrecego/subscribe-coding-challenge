require_relative './cart'
require_relative './cli'
require_relative './item'
require_relative './prompt'

class App
  def initialize
    @cli = CLI.new
    @prompt = Prompt.new
    @cart = Cart.new
  end

  def run
    puts "Welcome to the shopping cart! Type 'help' for a list of commands."
    while @cli.running?
      input = @prompt.ask('> ')
      commands.fetch(input.to_sym, -> { puts 'Command not available' }).call
    end
  end

  private

  def commands
    @commands ||= {
      add: -> { add_to_cart },
      clear: -> { @cart = Cart.new },
      exit: -> { @cli.stop },
      help: -> { help_commands },
      list: -> { puts Item.all },
      total: -> { puts @cart.total }
    }
  end

  def add_to_cart
    item = @prompt.choose('Choose an item to add:', Item.all)

    quantity = @prompt.number('Enter the quantity:', min: 1, max: 100)

    item.quantity = quantity

    @cart.add(item)
  end

  def help_commands
    puts <<~HELP
      Available commands:
        add: Add an item to the cart
        clear: Remove all items from the cart
        exit: Quit the program
        help: Display this message
        list: List all available items
        total: Display the total for the cart
    HELP
  end
end
