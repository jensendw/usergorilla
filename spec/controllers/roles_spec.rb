require 'spec_helper'


describe RolesController do
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
    it "should contain the created user roles" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      role=FactoryGirl.create(:role)
      visit 'roles'
      page.should have_content(user[:username])
      page.should have_content(role[:role])
    end

    it "should contain new role button" do
      visit 'roles'
      page.should have_selector(:link_or_button, 'New Role')
    end
  end



  describe "GET #new" do
    it "throws error on blank form" do
      visit '/roles/new'
      click_button('Create Role')
      page.should have_content('error')
    end

    it "create new role for user" do
      user=FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      visit '/roles/new'
      fill_in 'role_role', :with => 'role'
      click_button('Create Role')
      page.should have_content(user[:username])
      page.should have_content('role')

    end
  end

end