FactoryBot.define do
  factory :scale_item do
    scale { nil }
    item_number { 1 }
    item_text { "MyText" }
    item_type { "MyString" }
    scoring_rules { "" }
  end
end
