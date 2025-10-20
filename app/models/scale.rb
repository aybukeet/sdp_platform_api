class Scale < ApplicationRecord
  # Enums
  enum :status, { draft: 0, published: 1, archived: 2, under_review: 3 }

  # Associations
  belongs_to :user
  has_many :scale_items, dependent: :destroy
  has_many :survey_scales, dependent: :destroy
  has_many :surveys, through: :survey_scales

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :unique_identifier, presence: true, uniqueness: true
  validates :version, presence: true
  validates :language, presence: true, inclusion: { in: %w[en tr] }
  validates :status, presence: true

  # Callbacks
  before_validation :generate_unique_identifier, on: :create

  # Instance Methods
  def generate_unique_identifier
    return if unique_identifier.present?
    
    year = Time.current.year
    last_id = Scale.where("unique_identifier LIKE ?", "SDP-#{year}-%")
                   .order(created_at: :desc)
                   .first
                   &.unique_identifier
                   &.split('-')
                   &.last
                   &.to_i || 0
    
    self.unique_identifier = format("SDP-%d-%04d", year, last_id + 1)
  end

  def increment_usage
    increment!(:usage_count)
  end
end