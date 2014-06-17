class AccttypesController < ApplicationController
  before_action :set_accttype, only: [:show, :edit, :update, :destroy]

  # GET /accttypes
  # GET /accttypes.json
  def index
    if session[:isadmin]
      @accttypes = Accttype.all
    else
      render :status => :forbidden, :text => "You do not have access<br><br><a href=\"/\">Back</a>"
    end
  end

  # GET /accttypes/1
  # GET /accttypes/1.json
  def show
  end

  # GET /accttypes/new
  def new
    @accttype = Accttype.new
  end

  # GET /accttypes/1/edit
  def edit
  end

  # POST /accttypes
  # POST /accttypes.json
  def create
    @accttype = Accttype.new(accttype_params)

    respond_to do |format|
      if @accttype.save
        format.html { redirect_to @accttype, notice: 'Accttype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @accttype }
      else
        format.html { render action: 'new' }
        format.json { render json: @accttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accttypes/1
  # PATCH/PUT /accttypes/1.json
  def update
    respond_to do |format|
      if @accttype.update(accttype_params)
        format.html { redirect_to @accttype, notice: 'Accttype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @accttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accttypes/1
  # DELETE /accttypes/1.json
  def destroy
    @accttype.destroy
    respond_to do |format|
      format.html { redirect_to accttypes_url }
      format.json { head :no_content }
    end
  end

  def list
    @accttypes = Accttype.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accttype
      @accttype = Accttype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accttype_params
      params.require(:accttype).permit(:user_id, :accttype)
    end

end
