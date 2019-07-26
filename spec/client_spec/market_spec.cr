require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Market Client methods
  describe "Market" do
    it "retrieves history of a specific item in a specific server" do
      item_id = 3_u64
      client = XIVAPI::Client.new
      response = client.market item_id, "Lich", 2
      response.item.id.should eq item_id
    end

    it "retrieves history of a specific item in an array of servers" do
      item_id = 3_u64
      client = XIVAPI::Client.new
      response = client.market item_id, ["Lich", "Phoenix"], max_history: 2
      response["Lich"].item.id.should eq item_id
      response["Phoenix"].item.id.should eq item_id
    end

    it "retrieves history of a specific item in a datacenter" do
      item_id = 3_u64
      client = XIVAPI::Client.new
      response = client.market item_id, datacenter: "Light", max_history: 2
      response["Lich"]?.should_not be_nil
      response["Lich"].item.id.should eq item_id
    end

    it "retrieves history of specified items in an array of servers" do
      item_ids = [3_u64, 2_u64]
      client = XIVAPI::Client.new
      response = client.market item_ids, ["Lich", "Phoenix"], max_history: 2
      response.each_with_index do |item, index|
        item["Lich"]?.should_not be_nil
        item["Lich"].item.id.should eq item_ids[index]
      end
    end

    it "retrieves an array of sellable item ids" do
      client = XIVAPI::Client.new
      client.sellable_item_ids
    end

    it "retrieves an array of market board search categories" do
      client = XIVAPI::Client.new
      client.market_search_categories
    end
  end
end
