require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with all required fields" do
      @user = User.new(
        first_name: 'Nkiru',
        last_name: 'Odu',
        email: 'nkiru@example.com',
        password: 'password123',
        password_confirmation: 'password123' 
      )
      expect(@user).to be_valid
    end

    it "is invalid without a password" do
      @user = User.new(
        first_name: 'Nkiru',
        last_name: 'Odu',
        email: 'nkiru@example.com',
        password: nil,
        password_confirmation: 'password123'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is invalid when password and password confirmation do not match" do
      @user = User.new(
        first_name: 'Nkiru',
        last_name: 'Odu',
        email: 'nkiru@example.com',
        password: 'password123',
        password_confirmation: 'differentPassword'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 

    it "is invalid without a first name" do
      @user = User.new(
        first_name: nil,
        last_name: 'Odu',
        email: 'nkiru@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is invalid without a last name" do
      @user = User.new(
        first_name: 'Nkiru',
        last_name: nil,
        email: 'nkiru@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is invalid without an email" do
      @user = User.new(
        first_name: 'Nkiru',
        last_name: 'Odu',
        email: nil,
        password: 'password123',
        password_confirmation: 'password123'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid if password is too short' do
      @user = User.new(
        first_name: 'Nkiruka',
        last_name: 'Odu',
        email: 'nkiru@example.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create!(
        first_name: 'Nkiruka',
        last_name: 'Odu',
        email: 'nkiru@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    it 'authenticates with correct credentials' do
      authenticated_user = User.authenticate_with_credentials('nkiru@example.com', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'does not authenticate with wrong password' do
      authenticated_user = User.authenticate_with_credentials('nkiru@example.com', 'wrongpass')
      expect(authenticated_user).to be_nil
    end

    it 'authenticates even with email having extra spaces' do
      authenticated_user = User.authenticate_with_credentials('  nkiru@example.com  ', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'authenticates with mixed case email' do
      authenticated_user = User.authenticate_with_credentials('NKiRu@ExAMPle.com', 'password123')
      expect(authenticated_user).to eq(@user)
    end
  end
end
