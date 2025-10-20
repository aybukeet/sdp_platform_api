class AnalysisResponse < ApplicationRecord
  belongs_to :analysis
  belongs_to :response

  validates :response_id, uniqueness: { scope: :analysis_id }
end