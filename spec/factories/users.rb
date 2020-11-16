FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a-z' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"藤本"}
    first_name            {"典大"}
    last_name_kana        {"フジモト"}
    first_name_kana       {"ノリヒロ"}
    birthday              {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end