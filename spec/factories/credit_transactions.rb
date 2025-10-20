FactoryBot.define do
  factory :credit_transaction do
    user { nil }
    amount { 1 }
    transaction_type { 1 }
    reference_type { "MyString" }
    reference_id { "" }
  end
end
