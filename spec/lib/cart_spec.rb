require_relative '../../lib/cart'
require_relative '../../lib/item'

RSpec.describe Cart do
  describe '#total' do
    it 'prints the total for the cart to STDOUT' do
      cart = Cart.new
      item = Item.new(title: 'Book', type: 'book', price: 12.49)
      cart.add(item)

      expect(cart.total).to eq("1 Book: 12.49\nSales Taxes: 0.00\nTotal: 12.49")
    end

    context 'when the cart has multiple items' do
      it 'prints the total for the cart to STDOUT' do
        cart = Cart.new
        item = Item.new(title: 'Imported box fo chocolates', type: 'food', price: 11.25, imported: true, quantity: 3)

        cart.add(item)

        expect(cart.total).to eq("3 Imported box fo chocolates: 35.55\nSales Taxes: 1.80\nTotal: 35.55")
      end
    end
  end
end
