require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :role do |f|
    f.user_id 1
    f.role { Faker::Lorem.word}
  end
end

