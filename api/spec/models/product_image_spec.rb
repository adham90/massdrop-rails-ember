require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  context "#relations" do
    it { is_expected.to belong_to :product }
  end

  context "#validations" do
    it { is_expected.to validate_presence_of :image_id }
    it { is_expected.to validate_presence_of :product }
  end
end
