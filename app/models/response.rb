class Response < ApplicationRecord
  enum :completion_status, { started: 0, in_progress: 1, completed: 2, abandoned: 3 }

  belongs_to :survey
  has_many :analysis_responses, dependent: :destroy
  has_many :analyses, through: :analysis_responses

  validates :completion_status, presence: true

  scope :completed, -> { where(completion_status: :completed) }

  def calculate_scores
    return {} unless response_data.present?

    scores = {}
    survey.scales.each do |scale|
      scale_scores = scale.scale_items.map do |item|
        item.calculate_score(response_data[item.id.to_s])
      end
      scores[scale.id.to_s] = {
        total: scale_scores.compact.sum,
        average: scale_scores.compact.sum.to_f / scale_scores.size
      }
    end
    scores
  end
end