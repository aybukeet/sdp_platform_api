require 'rails_helper'

RSpec.describe Analysis, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:analysis_type) }
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:analysis_responses).dependent(:destroy) }
    it { should have_many(:responses).through(:analysis_responses) }
    it { should have_one(:report).dependent(:destroy) }
  end

  describe 'enums' do
    it { should define_enum_for(:analysis_type) }
    it { should define_enum_for(:status).with_values(pending: 0, running: 1, completed: 2, failed: 3, cancelled: 4) }
  end
end