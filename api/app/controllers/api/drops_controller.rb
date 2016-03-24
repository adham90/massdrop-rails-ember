class Api::DropsController < ApplicationController
  before_action :set_drop, only: [:show, :update, :destroy]

  # GET /drops
  # GET /drops.json
  def index
    @drops = Drop.all

    render json: @drops
  end

  # GET /drops/1
  # GET /drops/1.json
  def show
    render json: @drop
  end

  # POST /drops
  # POST /drops.json
  def create
    @drop = Drop.new(drop_params)

    if @drop.save
      render json: @drop, status: :created, location: @drop
    else
      render json: @drop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drops/1
  # PATCH/PUT /drops/1.json
  def update
    @drop = Drop.find(params[:id])

    if @drop.update(drop_params)
      head :no_content
    else
      render json: @drop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drops/1
  # DELETE /drops/1.json
  def destroy
    @drop.destroy

    head :no_content
  end

  private

    def set_drop
      @drop = Drop.find(params[:id])
    end

    def drop_params
      params.require(:drop).permit(:end_at, :state, :product_id)
    end
end
