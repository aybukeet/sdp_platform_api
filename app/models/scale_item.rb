class ScaleItem < ApplicationRecord
  # Associations
  belongs_to :scale

  # Validations
  validates :item_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :item_text, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :item_number, uniqueness: { scope: :scale_id }

  # Scopes
  scope :ordered, -> { order(:item_number) }

  # Instance Methods
  def calculate_score(response_value)
    return nil if scoring_rules.blank? || response_value.nil?
    
    scoring_rules.dig('mapping', response_value.to_s) || response_value
  end
end