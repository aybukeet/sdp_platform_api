FactoryBot.define do
  factory :analysis do
    user { nil }
    title { "MyString" }
    analysis_type { 1 }
    parameters { "" }
    status { 1 }
    credit_cost { 1 }
    results { "" }
    error_messages { "MyText" }
    started_at { "2025-10-19 16:33:14" }
    completed_at { "2025-10-19 16:33:14" }
  end
end
