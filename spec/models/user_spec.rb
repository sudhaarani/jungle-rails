require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with all fields' do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end
    it "is not valid when passwords do not match" do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password1'
      ) 
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'is not valid with a Empty password field' do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: '',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'is not valid with a Empty password_confirmation field' do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: ''
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'is not valid with a Empty Name field' do
      user = User.new(
        name: "",
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid with a Empty email field' do
      user = User.new(
        name: "Test Name",
        email: '',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'is not valid if the email is not unique' do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user1 = User.new(
        name: "Test Name",
        email: 'tesT@gmail.COM', #checking with upper case
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user1).to_not be_valid
      # expect(user1.errors.full_messages).to include("Email has already been taken")
    end
    it 'is not valid with a passowrd less than 8 characters' do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'is valid if the email has space' do
      user = User.new(
        name: "Test Name",
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      return_user=User.authenticate_with_credentials(" test@gmail.com ","password")
      expect(return_user).to eq(user)
    end
  end
end
