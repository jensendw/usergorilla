require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :oauser do
    provider "ldap"
    uid "CN=Daniel Jensen,OU=users"
    name { Faker::Name.name}
  end
end
