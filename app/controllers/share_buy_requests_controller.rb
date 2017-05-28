class ShareBuyRequestsController < ApplicationController
  before_action :set_share_buy_request, only: [:show, :edit, :update, :destroy, :transfer]

  # GET /share_buy_requests
  # GET /share_buy_requests.json
  def transfer
    @share_buy_request.shares.update_all(user_id: @share_buy_request.user_id, share_sell_request_id: nil)
    @share_buy_request.update(status: true)
    # send user emil of successfullpurchase of shares
    # UserMailer.use_email(@user).deliver


    respond_to do |format|
      format.html { redirect_to @share_buy_request, notice: 'Share transfer was successfull.' }

    end

  end


  def index
    if current_user.superadmin_role? && current_user.supervisor_role?
      @share_buy_requests = ShareBuyRequest.all

    else
      @share_buy_requests = ShareBuyRequest.where("user_id =?", current_user)

    end
  end

  # GET /share_buy_requests/1
  # GET /share_buy_requests/1.json
  def show
  end

  # GET /share_buy_requests/new
  def new
    @share_buy_request = ShareBuyRequest.new
  end

  # GET /share_buy_requests/1/edit
  def edit
  end

  # POST /share_buy_requests
  # POST /share_buy_requests.json
  def create
    @share_buy_request = ShareBuyRequest.new(share_buy_request_params)
    puts @share_buy_request
    @share_buy_request.user_id = current_user.id
    # @property = Property.find_by_Code(@share_buy_request.property_id)
    @property_id = Property.find_by_id(params[:property_id])
      # either assign property id or share sell request id
      if (@share_buy_request.share_sell_request_id != nil)
        @shares = Share.where("share_sell_request_id =?", @share_buy_request.share_sell_request_id)
        @share_buy_request.total = ShareSellRequest.find(@share_buy_request.share_sell_request_id).sale_price * @share_buy_request.no_of_shares + (300 * @share_buy_request.no_of_shares)
      else
        @shares = Share.where("property_id =?", @share_buy_request.property_id)
        @share_buy_request.total = Share.find_by_property_id(@share_buy_request.property_id).value * @share_buy_request.no_of_shares
      end
    @share_buy_request.property_id = @share_buy_request.property_id


    respond_to do |format|
      if @share_buy_request.save && @shares.where("status =?", false).count >= @share_buy_request.no_of_shares
         @shares.where("status =?", false).order("id").limit(@share_buy_request.no_of_shares).update_all(status: true, share_buy_request_id: @share_buy_request.id)
         SendEmailJob.set(wait: 20.seconds).perform_later(@share_buy_request.user_id)
         # UserMailer.purchase(@share_buy_request.user_id).deliver
        #  UserMailer.user_email(@share_buy_request.user_id).deliver

        format.html { redirect_to @share_buy_request, notice: 'Share buy request was successfully created.' }
        format.json { render :show, status: :created, location: @share_buy_request }
        format.js
      else
        format.html { redirect_to root_path, notice: 'Your Share Buy request was invalid, please enter a valid value.' }
        # format.html { render :new }
        format.json { render json: @share_buy_request.errors, status: :unprocessable_entity }
        format.js
      end


    end
  end

  # PATCH/PUT /share_buy_requests/1
  # PATCH/PUT /share_buy_requests/1.json
  def update
    respond_to do |format|
      if @share_buy_request.update(share_buy_request_params)
        format.html { redirect_to @share_buy_request, notice: 'Share buy request was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_buy_request }
      else
        format.html { render :edit }
        format.json { render json: @share_buy_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_buy_requests/1
  # DELETE /share_buy_requests/1.json
  def destroy
    Share.where("share_buy_request_id =?", @share_buy_request.id).update_all(status: false, share_buy_request_id: nil)
    @share_buy_request.destroy
    respond_to do |format|
      format.html { redirect_to share_buy_requests_url, notice: 'Share buy request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_buy_request
      @share_buy_request = ShareBuyRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_buy_request_params
      params.require(:share_buy_request).permit(:property_id, :no_of_shares, :user_id, :share_sell_request_id, :total, :transaction_id, :pay_method)
    end
end
