FactoryGirl.define do
  factory :user do
  	name 'Evan'
    email 'hello@gmail.com'
    password 'user12345'
    password_confirmation { password }
  end
end
