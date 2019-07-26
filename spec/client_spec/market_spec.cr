require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Market Client methods
  describe "Market" do
    it "retrieves history of a specific item in a specific server" do
      item_id = 3_u64
      client = XIVAPI::Client.new
      response = client.market_server_item "Lich", item_id, 2
      response.item.id.should eq item_id
    end
  end
end
