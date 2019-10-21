require "../spec_helper"

# Series of tests for the PvpTeam Client methods
describe "XIVAPI::Client::PvpTeam" do
  it "successfully searches for PvpTeam" do
    client = XIVAPI::Client.new
    page = client.pvp_team_search "a"
    # We don't usually get results from this, so as long as no exception is raised, we're grand.
  end

  it "successfully raises an exception if an invalid search is sent" do
    client = XIVAPI::Client.new
    ex = expect_raises(XIVAPI::Exceptions::XIVAPIException) do
      client.pvp_team_search ""
    end
    ex.api_exception.message.should eq "You must provide a name to search."
  end

  # I'd love to be able to do this but the search method returns no results so I guess we can't right now.
  # it "reads a PvpTeam properly" do
  #   client = XIVAPI::Client.new
  #   # Get the ID by doing a search and grabbing the first one.
  #   page = client.pvp_team_search "a"
  #   pvp_team = page.results[0]
  #   pvp_team_response = client.pvp_team pvp_team.id

  #   # Ensure we get a meaningful response
  #   pvp_team_response.pvp_team.should_not be_nil
  #   pvp_team_response.info.pvp_team.should_not be_nil
  # end
end
