class SessionsController < ApplicationController
  include SessionsHelper
  def create
    auth = request.env["omniauth.auth"]
    user = Oauser.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Oauser.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:full_name] = auth["extra"]["raw_info"]["displayname"]
    session[:nickname] = auth["info"]["nickname"]
    #groupinfo = auth["extra"]["raw_info"]["memberof"]
    session[:isadmin] = IsAdmin(auth["extra"]["raw_info"]["memberof"])

    ### end grabbing info
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:nickname] = nil
    session[:isadmin] = nil
    session[:fullname] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
