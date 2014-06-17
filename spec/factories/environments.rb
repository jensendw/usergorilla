require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :environment do |f|
    f.user_id 1
    f.environment { Faker::Lorem.word}
  end
end

