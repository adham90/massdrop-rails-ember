class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]

  def index
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

  def sign
    @expires = 10.hours.from_now
    render json: {
      acl: 'public-read',
      awsaccesskeyid: 'AKIAIYG7KMMXSMOKOATA',
      bucket: 'adham-test',
      expires: @expires,
      key: "uploads/#{params[:name]}",
      policy: policy,
      signature: signature,
      success_action_status: '201',
      'Content-Type' => params[:type],
      'Cache-Control' => 'max-age=630720000, public'
    }, status: :ok
  end

private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def file_params
    params.require('picture').permit(:image, :imageable_type, :imageable_id)
  end

  def signature
    Base64.strict_encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        'IfMxqImVyuuQSW/7xDbxkXZ+wBDsOfeVpzUaNh3o',
        policy({ secret_access_key: 'IfMxqImVyuuQSW/7xDbxkXZ+wBDsOfeVpzUaNh3o' })
      )
    )
  end

  def policy(options = {})
    Base64.strict_encode64(
      {
        expiration: @expires,
        conditions: [
          { bucket: 'adham-test' },
          { acl: 'public-read' },
          { expires: @expires },
          { success_action_status: '201' },
          [ 'starts-with', '$key', '' ],
          [ 'starts-with', '$Content-Type', '' ],
          [ 'starts-with', '$Cache-Control', '' ],
          [ 'content-length-range', 0, 524288000 ]
        ]
      }.to_json
    )
  end
end
