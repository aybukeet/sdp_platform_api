class CreditTransaction < ApplicationRecord
  enum :transaction_type, { addition: 0, deduction: 1, refund: 2 }

  belongs_to :user

  validates :amount, presence: true, numericality: { other_than: 0 }
  validates :transaction_type, presence: true

  scope :recent, -> { order(created_at: :desc) }
end