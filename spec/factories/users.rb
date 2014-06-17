require 'rspec'
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    #skip_create
    f.username { Faker::Internet.user_name}
    f.ingroups { Faker::Internet.user_name}
    f.shell "/bin/bash"
    f.password { Faker::Internet.password}
    f.realname { Faker::Name.name}
    f.ensure "present"
    f.ldapowner "djensen"
  end

end

