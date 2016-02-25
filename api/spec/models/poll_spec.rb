require 'rails_helper'

RSpec.describe Poll, type: :model do
  context "#relations" do
    it { is_expected.to belong_to :product }
  end
end
