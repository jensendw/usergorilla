require 'rspec'
require 'spec_helper'

describe 'Role' do

  it 'has a valid factory' do
    FactoryGirl.create(:role).should be_valid
  end
  it 'is invalid without user_id' do
    FactoryGirl.build(:role, user_id: nil).should_not be_valid
  end

  it 'is invalid without role' do
    FactoryGirl.build(:role, role: nil).should_not be_valid
  end
  it 'is invalid with non integer for user_id' do
    FactoryGirl.build(:role, user_id: "abcd").should_not be_valid
  end
end