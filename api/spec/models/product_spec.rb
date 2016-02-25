require 'rails_helper'

RSpec.describe Product, type: :model do
  context "#validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:msrp) }
  end

  context "#relations" do
    it { is_expected.to have_many :drops }
    it { is_expected.to have_many :polls }
    it { is_expected.to have_many :pictures }
  end
end
