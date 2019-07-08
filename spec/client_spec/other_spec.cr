require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Other Client methods
  it "retrieves an Array of Game Content items" do
    client = XIVAPI::Client.new
    content = client.content
  end

  describe "Other" do
    it "retrieves an Array of Patch data" do
      client = XIVAPI::Client.new
      patch_list = client.patch_list
    end
  end
end
