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

    it "retrieves an Array of Patch data" do
      client = XIVAPI::Client.new
      patch_list = client.patch_list
    end
  end
end
