require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Lodestone Client methods
  describe "Lodestone" do
    it "retrieves the cached Lodestone data" do
      client = XIVAPI::Client.new
      lodestone_data = client.lodestone
    end

    it "retrieves Palace of the Dead leaderboard data" do
      client = XIVAPI::Client.new
      leaderboard = client.palace_of_the_dead
    end

    it "retrieves Heaven on High leaderboard data" do
      client = XIVAPI::Client.new
      leaderboard = client.heaven_on_high
    end

    it "retrieves Feast leaderboard data" do
      client = XIVAPI::Client.new
      leaderboard = client.feasts "10"
    end
  end
end
