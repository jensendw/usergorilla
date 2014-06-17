require 'rspec'
require 'spec_helper'

describe 'Sshkey' do

  it 'has a valid factory' do
    FactoryGirl.create(:sshkey).should be_valid
  end
  it 'is invalid without user_id' do
    FactoryGirl.build(:sshkey, user_id: nil).should_not be_valid
  end

  it 'is invalid without key' do
    FactoryGirl.build(:sshkey, key: nil).should_not be_valid
  end

  it 'is invalid without keytype' do
    FactoryGirl.build(:sshkey, keytype: nil).should_not be_valid
  end

  it 'is invalid with non integer for user_id' do
    FactoryGirl.build(:sshkey, user_id: "abcd").should_not be_valid
  end
end