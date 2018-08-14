FactoryBot.define do
  factory User do
    username { Faker::Name }
    email { Faker::Internet.email }
    password 'password'
  end
end