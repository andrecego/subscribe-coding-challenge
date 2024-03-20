require_relative '../../lib/app'

RSpec.describe 'Main Tests' do
  describe 'Input 1' do
    it 'returns the expected output' do
      cart = Cart.new
      item1 = Item.new(title: 'Book', type: 'book', price: 12.49, quantity: 2)
      item2 = Item.new(title: 'Music CD', type: 'other', price: 14.99)
      item3 = Item.new(title: 'Chocolate Bar', type: 'food', price: 0.85)

      cart.add(item1)
      cart.add(item2)
      cart.add(item3)

      expect(cart.total).to eq("2 Book: 24.98\n1 Music CD: 16.49\n1 Chocolate Bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32")
    end
  end

  describe 'Input 2' do
    it 'returns the expected output' do
      cart = Cart.new
      item1 = Item.new(title: 'Imported box of chocolates', type: 'food', price: 10.00, imported: true)
      item2 = Item.new(title: 'Imported bottle of perfume', type: 'other', price: 47.50, imported: true)

      cart.add(item1)
      cart.add(item2)

      expect(cart.total).to eq("1 Imported box of chocolates: 10.50\n1 Imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15")
    end
  end

  describe 'Input 3' do
    it 'returns the expected output' do
      cart = Cart.new
      item1 = Item.new(title: 'Imported bottle of perfume', type: 'other', price: 27.99, imported: true)
      item2 = Item.new(title: 'Bottle of perfume', type: 'other', price: 18.99)
      item3 = Item.new(title: 'Packet of headache pills', type: 'medical', price: 9.75)
      item4 = Item.new(title: 'Box of imported chocolates', type: 'food', price: 11.25, imported: true, quantity: 3)

      cart.add(item1)
      cart.add(item2)
      cart.add(item3)
      cart.add(item4)

      output_text = "1 Imported bottle of perfume: 32.19\n" \
                    "1 Bottle of perfume: 20.89\n" \
                    "1 Packet of headache pills: 9.75\n" \
                    "3 Box of imported chocolates: 35.55\n" \
                    "Sales Taxes: 7.90\n" \
                    'Total: 98.38'
      expect(cart.total).to eq(output_text)
    end
  end
end
