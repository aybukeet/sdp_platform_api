require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:distribution_mode) }
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:survey_scales).dependent(:destroy) }
    it { should have_many(:scales).through(:survey_scales) }
    it { should have_many(:responses).dependent(:destroy) }
  end

  describe 'enums' do
    it { should define_enum_for(:distribution_mode).with_values(online: 0, offline: 1, hybrid: 2) }
    it { should define_enum_for(:status).with_values(draft: 0, active: 1, paused: 2, completed: 3, archived: 4) }
  end
end