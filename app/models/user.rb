class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # Enums
  enum :role, { researcher: 0, clinician: 1, student: 2, admin: 3 }

  # Associations
  has_many :scales, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :analyses, dependent: :destroy
  has_many :credit_transactions, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :credit_balance, numericality: { greater_than_or_equal_to: 0 }
  validates :locale, inclusion: { in: %w[en tr] }

  # Instance Methods
  def has_credits?(amount)
    credit_balance >= amount
  end
end