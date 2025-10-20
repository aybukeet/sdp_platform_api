class Analysis < ApplicationRecord
  enum :analysis_type, {
    descriptive: 0, correlation: 1, chi_square: 2,
    independent: 3, dependent: 4, factor: 5,
    reliability: 6, regression: 7, survival: 8, roc: 9
  }
  enum :status, { pending: 0, running: 1, completed: 2, failed: 3, cancelled: 4 }

  belongs_to :user
  has_many :analysis_responses, dependent: :destroy
  has_many :responses, through: :analysis_responses
  has_one :report, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :analysis_type, presence: true
  validates :status, presence: true
  validates :credit_cost, numericality: { greater_than_or_equal_to: 0 }

  scope :by_type, ->(type) { where(analysis_type: type) }
  scope :completed, -> { where(status: :completed) }
end