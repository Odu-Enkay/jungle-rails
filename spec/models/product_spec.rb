require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create!(name: "Test Category")  # persist category for valid association
    end

    it 'is valid with all required fields present' do
      product = Product.new(
        name: "Sample Product",
        price: 5,
        quantity: 2,
        category: @category
      )
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = Product.new(
        name: nil,
        price: 6,
        quantity: 3,
        category: @category
      )
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end 

    it 'is invalid without a price' do
      product = Product.new(
        name: 'Oregano',
        price: nil,
        quantity: 1,
        category: @category
      )
      product.valid?
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      product = Product.new(
        name: 'Oregano',
        price: 5000,
        quantity: nil,
        category: @category
      )
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      product = Product.new(
        name: 'Oregano',
        price: 6000,
        quantity: 3,
        category: nil
      )
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
