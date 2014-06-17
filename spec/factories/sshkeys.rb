require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :sshkey do |f|
    f.user_id 1
    f.key { Faker::Lorem.characters(560) }
    f.keytype { Faker::Name.name}
  end
end

