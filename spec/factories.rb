FactoryBot.define do
  factory :user do
    first_name { 'Jon' }
    last_name { 'Doe' }
    email { 'example@email.com' }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
