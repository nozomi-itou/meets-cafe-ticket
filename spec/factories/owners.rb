FactoryBot.define do
  factory :owner do
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.in_date_period}
    post_code { '123-4567' }
    area_id { 2 }
    city { '練馬区' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
