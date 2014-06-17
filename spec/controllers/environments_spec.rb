require 'spec_helper'


describe EnvironmentsController do
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
    it "should contain the created user and environments" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      environment=FactoryGirl.create(:environment)
      visit 'environments'
      page.should have_content(user[:username])
      page.should have_content(environment[:environment])

    end

    it "should contain new environment button" do
      visit 'environments'
      page.should have_selector(:link_or_button, 'New Environment')
    end
  end

  describe "GET #new" do
    it "create environment for user" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      FactoryGirl.create(:environment)
      visit '/accttypes/new'
      click_button('Create')
      page.should have_content(user[:username])
    end
  end


end