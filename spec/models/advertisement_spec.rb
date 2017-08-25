require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) {Advertisement.create!(title: "Half off today", body: "Polar fleece for winter", price: 25) }

  describe "attributes" do
    it "has title, body and price attributes" do
      expect(advertisement).to have_attributes(title: "Half off today", body: "Polar fleece for winter", price: 25)
    end
  end
end
