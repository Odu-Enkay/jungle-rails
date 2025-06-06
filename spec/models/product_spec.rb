require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'must be present for all fields present' do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Sample Product",
        price: 5,
        quantity: 2,
        category: @category
      )
      @product.save!
      expect(@product).to be_present
    end
    
    it 'is invalid without a name' do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: nil,
        price: 6,
        quantity: 3,
        category: @category
      )
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end 

    it 'is invalid without a price' do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: 'Oregano',
        price_cents: nil,
        quantity: 1,
        category:@category
      )
      @product.valid?
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'is invalid without a quantity' do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: 'Oregano',
        price: 5000,
        quantity: nil,
        category:@category
      )
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: 'Oregano',
        price: 6000,
        quantity: 3,
        category:nil
      )
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end