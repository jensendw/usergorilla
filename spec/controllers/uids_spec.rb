require 'spec_helper'

describe UidsController do
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
    it "it displays user and uid" do
      user = FactoryGirl.create(:uid)
      user = FactoryGirl.create(:user)
      visit 'uids'
      page.should have_content(user[:username])
    end



  end


end

