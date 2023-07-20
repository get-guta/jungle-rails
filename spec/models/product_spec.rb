require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name: 'Example Category')
      @product = Product.new(
        name: 'Example Product',
        price_cents: 1000,
        quantity: 10,
        category: @category
      )
    end

    context 'when all fields are set' do
      it 'should save successfully' do
        expect(@product.save).to be true
      end
    end

    context 'when name is not present' do
      it 'should not save and have an error message' do
        @product.name = nil
        @product.save
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'when price is not present' do
      it 'should not save and have an error message' do
        @product.price_cents = nil
        @product.save
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'when quantity is not present' do
      it 'should not save and have an error message' do
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'when category is not present' do
      it 'should not save and have an error message' do
        @product.category = nil
        @product.save
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
