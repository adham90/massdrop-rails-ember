class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :update, :destroy]

  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.all

    render json: @communities
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    render json: @community
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)

    if @community.save
      render json: @community, status: :created, location: @community
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    @community = Community.find(params[:id])

    if @community.update(community_params)
      head :no_content
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy

    head :no_content
  end

  private

    def set_community
      @community = Community.find(params[:id])
    end

    def community_params
      params.require(:community).permit(:name, :description, :icon, :cover_image)
    end
end
