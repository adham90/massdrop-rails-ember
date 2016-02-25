require 'rails_helper'

RSpec.describe Drop, type: :model do
  context "#relations" do
    it { is_expected.to belong_to :product }
  end
end
