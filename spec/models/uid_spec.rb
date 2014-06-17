require 'rspec'
require 'spec_helper'

describe 'Uid' do

  it 'has a valid factory' do
    FactoryGirl.create(:uid).should be_valid
  end
  it 'is invalid without user_id' do
    FactoryGirl.build(:uid, user_id: nil).should_not be_valid
  end

  it 'is invalid without uid' do
    FactoryGirl.build(:uid, uid: nil).should_not be_valid
  end

end