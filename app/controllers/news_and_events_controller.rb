class NewsAndEventsController < ApplicationController
  before_action :set_news_and_event, only: [:show, :edit, :update, :destroy]

  # GET /news_and_events
  # GET /news_and_events.json
  def index
    @news_and_events = NewsAndEvent.all
  end

  # GET /news_and_events/1
  # GET /news_and_events/1.json
  def show
  end

  # GET /news_and_events/new
  def new
    @news_and_event = NewsAndEvent.new
  end

  # GET /news_and_events/1/edit
  def edit
  end

  # POST /news_and_events
  # POST /news_and_events.json
  def create
    @news_and_event = NewsAndEvent.new(news_and_event_params)

    respond_to do |format|
      if @news_and_event.save
        format.html { redirect_to @news_and_event, notice: 'News and event was successfully created.' }
        format.json { render :show, status: :created, location: @news_and_event }
      else
        format.html { render :new }
        format.json { render json: @news_and_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_and_events/1
  # PATCH/PUT /news_and_events/1.json
  def update
    respond_to do |format|
      if @news_and_event.update(news_and_event_params)
        format.html { redirect_to @news_and_event, notice: 'News and event was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_and_event }
      else
        format.html { render :edit }
        format.json { render json: @news_and_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_and_events/1
  # DELETE /news_and_events/1.json
  def destroy
    @news_and_event.destroy
    respond_to do |format|
      format.html { redirect_to news_and_events_url, notice: 'News and event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_and_event
      @news_and_event = NewsAndEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_and_event_params
      params.require(:news_and_event).permit(:title, :post)
    end
end
