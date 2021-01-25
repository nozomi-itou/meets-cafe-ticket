FactoryBot.define do
  factory :shop do
    shop_name {"shopの名前"}
    address {"shopの所在地"}
    phone {'090-1234-5678'}
    open_close {"7時〜23時"}
    drink {"・ブレンドコーヒー ・抹茶ミルク"}
    area_id { 5 }

    association :owner

    after(:build) do |shop|
      shop.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
