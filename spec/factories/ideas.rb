FactoryBot.define do
  factory :idea do
    title { '応援したい' }
    purpose { '元気にする' }
    description { '頑張る' }
    category_id { 2 }

    association :user
  end
end
