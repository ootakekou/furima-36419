FactoryBot.define do
  factory :purchase_delivery do
    postal_code                 { '123-4567' }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    city                        { '渋谷区' }
    city_number                 { '1-1-1' }
    telephone                   { '09012345678' }
    token                       { 'aaaaaaaaaaaaaaaaa'}
  end
end