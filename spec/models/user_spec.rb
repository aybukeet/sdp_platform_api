require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        name: 'Test User',
        role: 0,
        credit_balance: 100
      )
      expect(user).to be_valid
    end

    it 'requires a name' do
      user = User.new(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        name: nil
      )
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'requires credit_balance to be non-negative' do
      user = User.new(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        name: 'Test',
        credit_balance: -10
      )
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:scales).dependent(:destroy) }
    it { should have_many(:surveys).dependent(:destroy) }
    it { should have_many(:analyses).dependent(:destroy) }
    it { should have_many(:credit_transactions).dependent(:destroy) }
  end

  describe 'enums' do
    it { should define_enum_for(:role).with_values(researcher: 0, clinician: 1, student: 2, admin: 3) }
  end

  describe 'methods' do
    let(:user) { User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', name: 'Test User', credit_balance: 100) }

    it 'checks if user has credits' do
      expect(user.has_credits?(50)).to be true
      expect(user.has_credits?(150)).to be false
    end

    it 'deducts credits successfully' do
      result = user.deduct_credits(30)
      expect(result).to be true
      user.reload
      expect(user.credit_balance).to eq(70)
    end

    it 'does not deduct more credits than available' do
      result = user.deduct_credits(150)
      expect(result).to be false
      user.reload
      expect(user.credit_balance).to eq(100)
    end

    it 'adds credits successfully' do
      result = user.add_credits(50)
      expect(result).to be true
      user.reload
      expect(user.credit_balance).to eq(150)
    end
  end
end