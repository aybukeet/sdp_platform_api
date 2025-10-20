FactoryBot.define do
  factory :survey do
    user { nil }
    title { "MyString" }
    description { "MyText" }
    distribution_mode { 1 }
    status { 1 }
    start_date { "2025-10-19 16:32:27" }
    end_date { "2025-10-19 16:32:27" }
    target_participants { 1 }
    actual_participants { 1 }
    completion_rate { "9.99" }
    settings { "" }
  end
end
