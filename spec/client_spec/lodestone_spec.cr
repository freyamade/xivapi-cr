require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Lodestone Client methods
  describe "Lodestone" do
    it "retrieves the cached Lodestone data" do
      client = XIVAPI::Client.new
      lodestone_data = client.lodestone
    end

    it "retrieves Feast leaderboard data" do
      client = XIVAPI::Client.new
      leaderboard = client.feasts "10"
    end
  end
end
