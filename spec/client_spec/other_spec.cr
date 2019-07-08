require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Other Client methods
  describe "Other" do
    it "retrieves an Array of Patch data" do
      client = XIVAPI::Client.new
      patches = client.patch_list
    end
  end
end
