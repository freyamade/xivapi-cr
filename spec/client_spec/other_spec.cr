require "../spec_helper"

describe XIVAPI::Client do
  describe "Other" do
    # Series of tests for the Other Client methods
    it "searches the API for certain content" do
      client = XIVAPI::Client.new
      results = client.search "In Too Deep", indexes: ["Achievement"]
      # Find the "In Too Deep I" achievement in the response
      found = false
      results.results.each do |result|
        if result.name == "In Too Deep I"
          found = true
          break
        end
      end
      fail "Could not find the 'In Too Deep I' achievement in the response" unless found
    end

    it "searches the API for Lore" do
      name = "Brute Justice"
      client = XIVAPI::Client.new
      results = client.lore name, include_data: true
      # Find the "Metal - Brute Justice Mode Orchestrion Roll" in the response
      found = false
      results.results.each do |result|
        if result.data.not_nil!.name == name
          found = true
          break
        end
      end
      fail "Could not find the 'Metal - Brute Justice Mode Orchestrion Roll' in the response" unless found
    end

    it "retrieves an Array of Game Content items" do
      client = XIVAPI::Client.new
      content = client.content
    end

    it "retrieves a page of all Items" do
      client = XIVAPI::Client.new
      content = client.list_game_data("item")
      fail "Cound not find all items" unless content.results.size != 50
    end

    it "retrieves 2 items" do
      client = XIVAPI::Client.new
      ids = [17,18]
      name1 = "Earth Cluster"
      name2 = "Lightning Cluster"
      results = client.list_game_data("item", ids: ids)
      found1 = false
      found2 = false
      results.results.each do |result|
        if result.name.not_nil! == name1
          found1 = true
        end
        if result.not_nil!.name == name2
          found2 = true
        end
      end
      fail "Cound not find the 'Earth Cluster' in the response" unless found1 && found2
    end

    it "retrieves an item" do
      client = XIVAPI::Client.new
      id = 19
      name = "Water Cluster"
      result = client.read_game_data("item", id)
      found = false
      if result["Name"].not_nil! == name
        found = true
      end
      fail "Cound not find the 'Water Cluster'" unless found
    end

    it "retrieves an Array of Patch data" do
      client = XIVAPI::Client.new
      patch_list = client.patch_list
    end
  end
end
