class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if session[:isadmin]
      @users = User.all
    elsif session[:user_id]
      @users = User.where("ldapowner LIKE ?", "%#{session[:nickname]}%")
    else
      redirect_to "/auth/ldap"
    end


  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def reset_password
    @user = User.find(params[:id])

  end

  def do_password_reset
    #password = `openssl passwd -noverify -1 #{params[:password]}`
    User.find(params[:id]).update(password: create_linux_password(params[:password]))
    redirect_to users_path
  end

  def create_account
    session[:nickname]
    User.create(username: session[:nickname], ingroups: "", shell: "/bin/bash", password: create_linux_password(:session[:nickname]), realname: session[:full_name], ensure: "present", ldapowner: session[:nickname])
  end

  def do_create_account

  end

  def list
    @users = User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :ingroups, :shell, :password, :realname, :ensure, :ldapowner, :user_password)
    end
end
