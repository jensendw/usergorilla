require 'spec_helper'


describe AccttypesController do
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
    page.set_rack_session(:isadmin => true)
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:ldap]
  end

  describe "GET #index" do
    it "creates account type for user" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      sshkey=FactoryGirl.create(:accttype)
      visit 'accttypes'
      page.should have_content(user[:username])
    end


    it "should contain new account type button" do
      FactoryGirl.create(:uid)
      FactoryGirl.create(:user)
      FactoryGirl.create(:accttype)
      visit "accttypes"
      page.should have_selector(:link_or_button, 'New Accttype')
    end
  end

  describe "GET #new" do
    it "create new account type" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      FactoryGirl.create(:accttype)
      visit '/accttypes/new'
      click_button('Create')
      page.should have_content(user[:username])
    end
  end

end