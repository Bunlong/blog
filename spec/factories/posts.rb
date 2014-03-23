FactoryGirl.define do
  factory :post do
    title 'Ruby on Rails'
    body 'Ruby on Rails is good'
    status 'open'
    category_id 1
  end
end