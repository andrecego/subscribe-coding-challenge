# frozen_string_literal: true

require_relative '../../lib/item'

RSpec.describe Item do
  describe '#taxed_price' do
    it 'returns the taxed price for the item' do
      item = Item.new(title: 'Book', type: 'book', price: 12.49)

      expect(item.taxed_price).to eq(12.49)
    end

    context 'when the item is imported' do
      it 'returns the taxed price for the item' do
        item = Item.new(title: 'Imported box fo chocolates', type: 'food', price: 11.25, imported: true, quantity: 3)

        expect(item.taxed_price).to eq(35.55)
      end
    end
  end
end
