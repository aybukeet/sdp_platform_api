FactoryBot.define do
  factory :response do
    survey { nil }
    participant_id { "MyString" }
    response_data { "" }
    demographic_data { "" }
    completion_status { 1 }
    started_at { "2025-10-19 16:32:58" }
    completed_at { "2025-10-19 16:32:58" }
    ip_address { "MyString" }
    device_info { "MyString" }
  end
end
