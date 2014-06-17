require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :uid do |f|
    f.user_id 1
    f.uid { Faker::Number.number(5)}
  end
end

