require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Servers Client methods
  describe "Servers" do
    it "retrieves an Array of Servers" do
      client = XIVAPI::Client.new
      servers = client.servers
      # We don't usually get results from this, so as long as no exception is raised, we're grand.
    end

    it "retrieves a Hash of Datacenter information" do
      client = XIVAPI::Client.new
      servers = client.datacenters
      # We don't usually get results from this, so as long as no exception is raised, we're grand.
    end
  end
end
