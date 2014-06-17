require 'rspec'
require 'spec_helper'

describe 'Environment' do

  it 'has a valid factory' do
    FactoryGirl.create(:environment).should be_valid
  end
  it 'is invalid without user_id' do
    FactoryGirl.build(:environment, user_id: nil).should_not be_valid
  end

  it 'is invalid without environment' do
    FactoryGirl.build(:environment, environment: nil).should_not be_valid
  end
  it 'is invalid with non integer for user_id' do
    FactoryGirl.build(:environment, user_id: "abcd").should_not be_valid
  end

end