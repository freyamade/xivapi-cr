require "./spec_helper"

# Special test suite for found bugs to make sure we don't regress
describe "Regression Tests" do
  it "correctly searches for 'Iron Claw Hammer'" do
    client = XIVAPI::Client.new
    client.search(string: "Iron Claw Hammer", indexes: ["Item"], string_algo: "match")
  end
end
