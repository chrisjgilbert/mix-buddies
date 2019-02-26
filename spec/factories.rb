FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end

  factory :mix do
    user
    name { Faker::Music.album }
    url { Faker::Internet.url }
    tag_list { Faker::Music.genre }
  end
end
