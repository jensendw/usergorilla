require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :accttype do |f|
    f.user_id 1
    f.accttype { Faker::Lorem.word }
  end
end

