require 'rails_helper'

RSpec.describe Scale, type: :model do
  describe 'validations' do
  let(:user) { User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', name: 'Test User', credit_balance: 100) }
  
  it 'is valid with valid attributes' do
    scale = Scale.new(
      title: 'Test Scale',
      version: '1.0.0',
      language: 'en',
      status: 1,
      user: user
    )
    expect(scale).to be_valid
  end

  it 'validates presence of title' do
    scale = Scale.new(title: nil, user: user, version: '1.0.0', language: 'en', status: 1)
    expect(scale).not_to be_valid
  end

  it 'validates presence of version' do
    scale = Scale.new(title: 'Test', version: nil, user: user, language: 'en', status: 1)
    expect(scale).not_to be_valid
  end
end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:scale_items).dependent(:destroy) }
    it { should have_many(:survey_scales).dependent(:destroy) }
    it { should have_many(:surveys).through(:survey_scales) }
  end

  describe 'unique_identifier generation' do
    let(:user) { User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123', name: 'Test User', credit_balance: 100) }
    
    it 'generates unique identifier on create' do
      scale = Scale.create!(title: 'Test Scale', version: '1.0.0', language: 'en', user: user, status: 1)
      expect(scale.unique_identifier).to match(/^SDP-\d{4}-\d{4}$/)
    end
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(draft: 0, published: 1, archived: 2, under_review: 3) }
  end
end