require 'rails_helper'

RSpec.describe Product, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # validation tests/examples here
    it 'must be present for all fields present' do
      @category = Category.new(name: "Test Category")
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
      @category = Category.new(name: "Test Category")
      @product = Product.new(
        name: nil,
        price: 6,
        quantity: 3,
        category: @category
      )
      @product.valid?
      expect(@product.name).to be_nil
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end 

    it 'is invalid without a price' do
      @category = Category.new(name: "Test Category")
      @product = Product.new(
        name: 'Oregano',
        #price: nil,
        quantity: 1,
        category:@category
      )
      @product.valid?
      #expect(@product.price).to be_nil
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      @category = Category.new(name: "Test Category")
      @product = Product.new(
        name: 'Oregano',
        price: 5000,
        quantity: nil,
        category:@category
      )
      @product.valid?
      expect(@product.quantity).to be_nil
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      @category = Category.new(name: "Test Category")
      @product = Product.new(
        name: 'Oregano',
        price: 6000,
        quantity: 3,
        category:nil
      )
      @product.valid?
      expect(@product.category).to be_nil
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
