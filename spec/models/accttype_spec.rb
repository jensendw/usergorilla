require 'rspec'
require 'spec_helper'

describe 'Accttype' do

  it 'has a valid factory' do
    FactoryGirl.create(:accttype).should be_valid
  end
  it 'is invalid without user_id' do
    FactoryGirl.build(:accttype, user_id: nil).should_not be_valid
  end

  it 'is invalid without accttype' do
    FactoryGirl.build(:accttype, accttype: nil).should_not be_valid
  end
  it 'is invalid with non integer for user_id' do
    FactoryGirl.build(:accttype, user_id: "abcd").should_not be_valid
  end
end