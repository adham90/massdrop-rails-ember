class Api::PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy]

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all

    render json: @polls
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    render json: @poll
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      render json: @poll, status: :created, location: @poll
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    @poll = Poll.find(params[:id])

    if @poll.update(poll_params)
      head :no_content
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy

    head :no_content
  end

  private

    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:state, :product_id)
    end
end
