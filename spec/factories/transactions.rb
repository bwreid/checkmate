# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    tdate "2013-03-19"
    amount "9.99"
    notes "MyString"
  end
end
