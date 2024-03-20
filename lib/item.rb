# frozen_string_literal: true

# Class to represent an item, this class ideally would be split into a Item and CartItem class
# to better represent the domain
class Item
  TAX_PERCENT = 0.10
  TAX_FREE_TYPES = %w[book food medical]
  IMPORTED_TAX = 0.05

  attr_accessor :quantity
  attr_reader :title, :price, :type, :imported

  def initialize(title:, price:, type:, imported: false, quantity: 1)
    @title = title
    @price = price
    @type = type
    @imported = imported
    @quantity = quantity
  end

  def to_s
    "#{@title}: #{@price}"
  end

  def self.all
    all_items = JSON.parse(File.read('data/products.json'), symbolize_names: true)

    all_items.map do |item|
      Item.new(
        title: item[:title],
        price: item[:price],
        type: item[:type],
        imported: item[:imported]
      )
    end
  end

  def taxed_price
    (@quantity * (@price + tax)).round(2)
  end

  def tax
    item_tax = 0
    item_tax += TAX_PERCENT unless TAX_FREE_TYPES.include?(@type)
    item_tax += IMPORTED_TAX if @imported
    round_up_to_nearest_5_cents(item_tax * @price)
  end

  private

  def round_up_to_nearest_5_cents(amount)
    (amount * 20).ceil / 20.0
  end
end
