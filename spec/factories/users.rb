# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: User do
    username "x"
    password "x"
    password_confirmation "x"
  end
end
