require 'spec_helper'


describe UsersController do
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
    it "should contain the created users data" do
      FactoryGirl.create(:uid)
      user=FactoryGirl.create(:user)
      visit 'users'
      page.should have_content(user[:username])
    end

    it "should contain new user button" do
      page.set_rack_session(:isadmin => true)
      visit 'users'
      page.should have_selector(:link_or_button, 'New User')
    end

    it "should contain create my account button for non admin user" do
      page.set_rack_session([:user_id] => true)
      visit 'users'
      page.should have_selector(:link_or_button, 'Create my Account')
    end

    it "should contain Users menu item" do
      visit 'users'
      page.should have_selector(:link_or_button, 'Users')
    end

    it "should contain SSH Keys menu item" do
      visit 'users'
      page.should have_selector(:link_or_button, 'SSH Keys')
    end
  end

  describe "GET #new" do
    it "creates a user using form" do
      FactoryGirl.create(:uid)
      visit '/users/new'
      fill_in 'user_username', :with => 'djensen'
      fill_in 'user_ingroups', :with => 'wheel'
      fill_in 'user_shell', :with => 'djensen'
      fill_in 'user_password', :with => 'djensen'
      fill_in 'user_realname', :with => 'djensen'
      fill_in 'user_ensure', :with => 'present'
      fill_in 'user_ldapowner', :with => 'djensen'
      click_button('Create User')
      #save_and_open_page
      page.should have_content('djensen')
      page.should have_content('wheel')
      page.should have_content('present')
    end

    it "throws error on blank form" do
      visit '/users/new'
      click_button('Create User')
      page.should have_content('error')
    end

  end

end