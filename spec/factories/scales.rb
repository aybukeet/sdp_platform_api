FactoryBot.define do
  factory :scale do
    unique_identifier { "MyString" }
    title { "MyString" }
    description { "MyText" }
    version { "MyString" }
    language { "MyString" }
    author { "MyString" }
    publication_year { 1 }
    citation_count { 1 }
    usage_count { 1 }
    category { "MyString" }
    metadata { "" }
    status { 1 }
    user { nil }
  end
end
