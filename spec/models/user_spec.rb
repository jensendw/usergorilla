require 'rspec'
require 'spec_helper'

describe 'User' do

  it 'has a valid factory' do
    FactoryGirl.create(:uid).should be_valid
    FactoryGirl.create(:user).should be_valid
  end
  it 'is invalid without a username' do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it 'is invalid without shell' do
    FactoryGirl.build(:user, shell: nil).should_not be_valid
  end
  it 'is valid without ingroups' do
    FactoryGirl.build(:user, ingroups: nil).should be_valid
  end
  it 'is invalid without password' do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  it 'is invalid without realname' do
    FactoryGirl.build(:user, realname: nil).should_not be_valid
  end
  it 'is invalid without ensure' do
    FactoryGirl.build(:user, ensure: nil).should_not be_valid
  end
  it 'is invalid without ldapowner' do
    FactoryGirl.build(:user, ldapowner: nil).should_not be_valid
  end


end