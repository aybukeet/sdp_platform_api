FactoryBot.define do
  factory :report do
    analysis { nil }
    title { "MyString" }
    format { 1 }
    content { "MyText" }
    export_url { "MyString" }
    version { 1 }
  end
end
