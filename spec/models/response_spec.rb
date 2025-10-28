require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:completion_status) }
  end

  describe 'associations' do
    it { should belong_to(:survey) }
    it { should have_many(:analysis_responses).dependent(:destroy) }
    it { should have_many(:analyses).through(:analysis_responses) }
  end

  describe 'enums' do
    it { should define_enum_for(:completion_status).with_values(started: 0, in_progress: 1, completed: 2, abandoned: 3) }
  end
end