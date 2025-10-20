class SurveyScale < ApplicationRecord
  belongs_to :survey
  belongs_to :scale

  validates :scale_id, uniqueness: { scope: :survey_id }
end