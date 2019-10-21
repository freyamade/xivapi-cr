require "../spec_helper"

# Series of tests for the Servers Client methods
describe "XIVAPI::Client::Servers" do
  it "retrieves an Array of Servers" do
    client = XIVAPI::Client.new
    servers = client.servers
  end

  it "retrieves a Hash of Datacenter information" do
    client = XIVAPI::Client.new
    datacenters = client.datacenters
  end
end
