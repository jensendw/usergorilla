class SshkeysController < ApplicationController
  before_action :set_sshkey, only: [:show, :edit, :update, :destroy]
  include SshkeysHelper

  # GET /sshkeys
  # GET /sshkeys.json
  def index
    if session[:isadmin]
      @sshkeys = Sshkey.all
    else
      #user_id = User.where("ldapowner LIKE ?", "%#{session[:nickname]}%")
      #@sshkeys = Sshkey.where("user_id LIKE ?", "%#{session[:nickname]}%")
      @something = Array.new
      @userids = ldap_owner_sshkeys(session[:nickname])

      @userids.each do |userid|
        @something = Sshkey.where(:user_id => userid).to_a
        if @something
          @sshkeys = @something
        else
          @sshkeys = []
        end

      end

    end


  end

  # GET /sshkeys/1
  # GET /sshkeys/1.json
  def show
  end

  # GET /sshkeys/new
  def new
    @sshkey = Sshkey.new
  end

  # GET /sshkeys/1/edit
  def edit
  end

  # POST /sshkeys
  # POST /sshkeys.json
  def create
    #@sshkey = Sshkey.new(sshkey_params)
    #@user = User.where("username = ?", session[:nickname])
    #raise sshkey_params[:user_id].inspect
    #raise @user.inspect.id
    #@user.each do |user|
      #raise user.id.inspect
      #raise sshkey_params[:user_id].inspect
      #if sshkey_params[:user_id] ==  user.id.to_s
        #@sshkey = Sshkey.new(sshkey_params)
        #raise @sshkey.inspect
      #end
      @sshkey = Sshkey.new(sshkey_params)

    respond_to do |format|
      if @sshkey.save
        format.html { redirect_to @sshkey, notice: 'Sshkey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sshkey }
      else
        format.html { render action: 'new' }
        format.json { render json: @sshkey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sshkeys/1
  # PATCH/PUT /sshkeys/1.json
  def update
    respond_to do |format|
      if @sshkey.update(sshkey_params)
        format.html { redirect_to @sshkey, notice: 'Sshkey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sshkey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sshkeys/1
  # DELETE /sshkeys/1.json
  def destroy
    @sshkey.destroy
    respond_to do |format|
      format.html { redirect_to sshkeys_url }
      format.json { head :no_content }
    end
  end

  def list
    @sshkeys = Sshkey.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sshkey
      @sshkey = Sshkey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sshkey_params
      params.require(:sshkey).permit(:user_id, :key, :keytype)
    end
end
