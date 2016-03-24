class Api::PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]

  def index
    render json: Picture.all
  end

  def show
    render json: @picture
  end

  def create
    @picture = Picture.new(file_params)
    if @picture.save
      render json: @picture, status: :created
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def file_params
    params.require(:picture).permit(:image, :imageable_type, :imageable_id)
  end
end
