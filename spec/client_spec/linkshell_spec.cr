require "../spec_helper"

describe XIVAPI::Client do
  # Series of tests for the Linkshell Client methods
  describe "Linkshell" do
    it "successfully searches for Linkshell" do
      client = XIVAPI::Client.new
      page = client.linkshell_search "a"
      # I don't have a linkshell and I don't like the idea of using someone else's to test as a constant.
      page.results.size.should_not eq 0
    end

    it "reads a Linkshell properly" do
      client = XIVAPI::Client.new
      # Get the ID by doing a search and grabbing the first one.
      page = client.linkshell_search "a"
      linkshell = page.results[0]
      linkshell_response = client.linkshell linkshell.id

      # Ensure we get a meaningful response
      linkshell_response.linkshell.should_not be_nil
      linkshell_response.info.linkshell.should_not be_nil
    end
  end
end
