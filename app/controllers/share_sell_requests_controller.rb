class ShareSellRequestsController < ApplicationController
  before_action :set_share_sell_request, only: [:show, :edit, :update, :destroy, :sale_transfer]

  # GET /share_sell_requests
  # GET /share_sell_requests.json
  # def buy_user_shares
  #   # byebug
  #   @buy_user_share_request = ShareBuyRequest.new
  #   # @no_of_shares = @buy_user_share_request(params[:no_of_shares])
  #
  #   @target_sell_request = ShareSellRequest.find(params[:id])
  #   @buy_user_share_request.property_id = @target_sell_request.property_id
  #   @buy_user_share_request.user_id = current_user.id
  #   @buy_user_share_request.no_of_shares = params[:no_of_shares]
  #   @shares = Share.where("share_sell_request_id =?", @target_sell_request.id)
  #
  #
  #   respond_to do |format|
  #     if @buy_user_share_request.save && @shares.where("status =?", false).count >= @buy_user_share_request.no_of_shares
  #        @shares.where("status =?", false).order("id").limit(@buy_user_share_request.no_of_shares).update_all(status: true, share_buy_request_id: @buy_user_share_request.id, user_id: nil)
  #        format.html {redirect_to @buy_user_share_request, notice: 'User share buy request successfull' }
  #        format.json { render :show, status: :created, location: @buy_user_share_request }
  #        format.js
  #
  #     else
  #       format.html { render :new }
  #       format.json { render json: @buy_user_share_request.errors, status: :unprocessable_entity }
  #       format.js
  #
  #     end
  #   end
  # end


  def sale_transfer
    @share_sell_request.shares.update_all(user_id: @share_sell_request.user_id)
    @share_sell_request.update(status: true)

    respond_to do |format|
      format.html {redirect_to @share_sell_request, notice: 'Share sale transfer was successfull.'}

    end

  end

  def index
    if current_user.superadmin_role? && current_user.supervisor_role?
      @share_sell_requests = ShareSellRequest.all
    else
      @share_sell_requests = ShareSellRequest.where("user_id =?", current_user)
    end
  end

  # GET /share_sell_requests/1
  # GET /share_sell_requests/1.json
  def show
  end

  # GET /share_sell_requests/new
  def new
    @share_sell_request = ShareSellRequest.new
  end

  # GET /share_sell_requests/1/edit
  def edit
  end

  # POST /share_sell_requests
  # POST /share_sell_requests.json
  def create
    @share_sell_request = ShareSellRequest.new(share_sell_request_params)
    @share_sell_request.user_id = current_user.id
    @property_id = Property.find_by_Code(@share_sell_request.property_id)
    # @share_sell_request.property_id = @property_id.id
    # add user id since only owned shares can be sold
    @shares = Share.where(property_id: @share_sell_request.property_id, user_id: @share_sell_request.user_id)

    respond_to do |format|
      if @share_sell_request.save && @shares.where("status =?", true).count >= @share_sell_request.no_of_shares
         @shares.where("status =?", true).order("id").limit(@share_sell_request.no_of_shares).update_all(status: false, share_sell_request_id: @share_sell_request.id)
         UserMailer.sell(@share_sell_request.user_id).deliver
        format.html { redirect_to @share_sell_request, notice: 'Share sell request was successfully created.' }
        format.json { render :show, status: :created, location: @share_sell_request }
      else
        format.html { redirect_to root_path, notice: 'Your Share Sell request was invalid, please enter a valid value.' }
        # format.html { render :new }
        format.json { render json: @share_sell_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_sell_requests/1
  # PATCH/PUT /share_sell_requests/1.json
  def update
    respond_to do |format|
      if @share_sell_request.update(share_sell_request_params)
        format.html { redirect_to @share_sell_request, notice: 'Share sell request was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_sell_request }
      else
        format.html { render :edit }
        format.json { render json: @share_sell_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_sell_requests/1
  # DELETE /share_sell_requests/1.json
  def destroy
    # @share_sell_request.destroy
    Share.where("share_sell_request_id =?", @share_sell_request.id).update_all(status: true, share_sell_request_id: nil)
    respond_to do |format|
      format.html { redirect_to share_sell_requests_url, notice: 'Share sell request was successfully Canceled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_sell_request
      @share_sell_request = ShareSellRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_sell_request_params
      params.require(:share_sell_request).permit(:property_id, :user_id, :no_of_shares, :sale_price, :validity_days)
    end
end
