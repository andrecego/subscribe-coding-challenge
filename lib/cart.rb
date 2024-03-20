# frozen_string_literal: true

require 'json'

# Class to represent a cart, this is where the items are added and the total is calculated
class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def total
    output = ''
    sales_tax = 0

    @items.each do |item|
      sales_tax += (item.tax * item.quantity)

      output += "#{item.quantity} #{item.title}: #{format('%.2f', item.taxed_price)}\n"
    end

    output += "Sales Taxes: #{format('%.2f', sales_tax)}\n"

    total_price = sales_tax + @items.map { |item| item.price * item.quantity }.sum

    output += "Total: #{format('%.2f', total_price)}"
  end
end
