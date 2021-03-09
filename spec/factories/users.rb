FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }

    password { "aiueo123"}
    password_confirmation { password }
    last_name { '竹山' }
    first_name { 'ひらがな' }
    last_name_kana { 'マナカナ' }
    first_name_kana { 'カナカナ' }
    birthday { '2021-04-30' }
  end
end