FactoryBot.define do
    factory :random_doctor, class: Doctor do
        first_name  { Faker::Name.first_name }
        last_name   { Faker::Name.last_name }
        email       { Faker::Internet.email }
        phone_no    { Faker::PhoneNumber.cell_phone_with_country_code }
        password    { "password" }
        category    { Category.all.sample }
    end
end