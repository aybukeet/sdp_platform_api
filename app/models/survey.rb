class Survey < ApplicationRecord
  # Enums
  enum :distribution_mode, { online: 0, offline: 1, hybrid: 2 }
  enum :status, { draft: 0, active: 1, paused: 2, completed: 3, archived: 4 }

  # Associations
  belongs_to :user
  has_many :survey_scales, dependent: :destroy
  has_many :scales, through: :survey_scales
  has_many :responses, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :distribution_mode, presence: true
  validates :status, presence: true
  validates :target_participants, numericality: { greater_than: 0 }, allow_nil: true

  # Instance Methods
  def calculate_completion_rate
    return 0.0 if responses.count.zero?
    
    (responses.where(completion_status: :completed).count.to_f / responses.count * 100).round(2)
  end

  def track_progress
    {
      total_responses: responses.count,
      completed_responses: responses.where(completion_status: :completed).count,
      completion_rate: calculate_completion_rate
    }
  end
end