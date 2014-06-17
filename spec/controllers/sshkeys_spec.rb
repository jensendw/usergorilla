require 'spec_helper'


describe SshkeysController do
  render_views

  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:ldap] = OmniAuth::AuthHash.new({
      'uid' => 'CN=Daniel Jensen',
      'provider' => 'ldap',
      'info' => {
          'name' => 'Daniel Jensen',
          'nickname' => 'djensen'
      },
      'extra' => {
          'raw_info' => {
              'memberof' => 'hosting'
          }
      }
    })
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:ldap]
  end

  describe "GET #index" do
    it "creates sshkey for user" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      sshkey=FactoryGirl.create(:sshkey)
      visit 'sshkeys'
      page.should have_content(user[:username])
      #save_and_open_page
    end


    it "should contain new ssh key button" do
      FactoryGirl.create(:uid)
      FactoryGirl.create(:user)
      FactoryGirl.create(:sshkey)
      visit "sshkeys"
      page.should have_selector(:link_or_button, 'New Sshkey')
    end
  end

  describe "GET #new" do
    it "throws error on blank form" do
      visit '/sshkeys/new'
      click_button('Create Sshkey')
      page.should have_content('error')
    end

    it "create new role for user" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      visit '/sshkeys/new'
      fill_in 'sshkey_key', :with => 'fdafsajjfs8888fdshfdse7fhfjldfjls'
      click_button('Create Sshkey')
      page.should have_content(user[:username])
    end
  end

end