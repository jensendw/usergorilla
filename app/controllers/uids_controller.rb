class UidsController < ApplicationController

    before_action :set_uid, only: [:show, :edit, :update, :destroy]
    include UidsHelper

    # GET /uids
    # GET /uids.json
    def index

        @uids = Uid.all

    end

    def destroy
      @uid.destroy
      respond_to do |format|
        format.html { redirect_to uids_url }
        format.json { head :no_content }
      end
    end

    def list
      @uids = Uid.all
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_uid
        @uid = Uid.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def uid_params
        params.require(:uid).permit(:user_id, :uid)
      end

end
