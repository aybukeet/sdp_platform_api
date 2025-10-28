class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable,
       :trackable,
       :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

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

  def deduct_credits(amount, reference_type: nil, reference_id: nil)
    return false unless has_credits?(amount)

    transaction do
      update!(credit_balance: credit_balance - amount)
      credit_transactions.create!(
        amount: -amount,
        transaction_type: :deduction,
        reference_type: reference_type,
        reference_id: reference_id
      )
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  def add_credits(amount, reference_type: nil, reference_id: nil)
    transaction do
      update!(credit_balance: credit_balance + amount)
      credit_transactions.create!(
        amount: amount,
        transaction_type: :addition,
        reference_type: reference_type,
        reference_id: reference_id
      )
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
  def full_name
    name || email.split('@').first
  end
end