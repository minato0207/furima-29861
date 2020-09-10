FactoryBot.define do
  factory :item do
    name                      {Faker::Name.initials}
    category_id               {rand(1..10)}
    price                     {rand(300..9999999)}
    text                      {"aaaaaaaaaaaaaaaaa"}
    status_id                 {rand(1..6)}
    area_id                   {rand(1..47)}
    day_standard_id           {rand(1..3)}
    delivery_fee_id           {rand(1..2)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
 
    
  end
end

