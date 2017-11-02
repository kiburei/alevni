class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy, :buy_shares]

  #load_and_authorize_resource

  #skip_before_action :authenticate_user!, :only => [:index]

  # def buy_shares
  #   # @property = Property.find(params[:id])
  #   # @openShares = @property.shares.where("status =?" false)
  #   @q = 5 #user input
  #   if @q <= @openShares.count
  #     #set status of q shares to true and set user_id to current user
  #
  #   end
  #
  # end
  # GET /properties
  # GET /properties.json
  def index
    # @properties = current_user.properties.find(params[:id])
    @properties = Property.where("EndOffer <=?", Date.today)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
    @sell_requests = @property.share_sell_requests.where.not(user_id: current_user)
    @share_sell_requests = @sell_requests.where("validity_days >=?", Date.today)
    # @shares = @property.shares
    if current_user.superadmin_role? && current_user.supervisor_role?
      @shares = @property.shares

    else
      @shares = @property.shares.where("user_id =?", current_user)

    end

  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json


  def create
    @property = Property.new(property_params)
    @property.Code = Property.p_code
    @property.Shares = @property.Price/10000
    @property.CurrentPrice = @property.Price
    @property.ShareValue = 10000
    # @property.StartOffer= Date.parse(@property.StartOffer, "%m/%d/%Y")
    @property.EndOffer = @property.StartOffer + 90.days

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end

     Share.generate_shares
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    @property.Rate = ((@property.CurrentPrice - @property.Price) / @property.Price) * 100
    @property.ShareValue = @property.CurrentPrice / @property.Shares
    # update share value in individual shares
    @property.shares.update_all(value: @property.ShareValue)
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Please Press edit to verify changes and PRESS UDATE again' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:Code, :County, :Price, :CurrentPrice, :Shares, :Rate, :ShareValue, :locality, :LR, :Title, :Reason, :StartOffer, :EndOffer, :user_id, :Area_of_land, :brochure)
    end
end
