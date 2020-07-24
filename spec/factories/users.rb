FactoryBot.define do
  factory :user do
    sequence(:email) { 'testuser@test.com' }
    sequence(:password) { 'password' }
    sequence(:password_confirmation) { 'password' }
  end
end
