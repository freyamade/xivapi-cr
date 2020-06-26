require "../spec_helper"

# Some Character detail constants that will be handy for the tests
CHARACTER_NAME   = "Erika Yukiko"
CHARACTER_SERVER = "Lich"
CHARACTER_ID     = 22909725_u64

# Series of tests for the Character Client methods
describe "XIVAPI::Client::Character" do
  it "successfully searches for Characters" do
    client = XIVAPI::Client.new
    page = client.character_search CHARACTER_NAME
    character = page.results[0]
    character.name.should eq CHARACTER_NAME
    character.server.should contain CHARACTER_SERVER
  end

  it "successfully raises an exception if an invalid search is sent" do
    client = XIVAPI::Client.new
    ex = expect_raises(XIVAPI::Exceptions::XIVAPIException) do
      client.character_search ""
    end
    ex.api_exception.message.should eq "You must provide a name to search."
  end

  it "has an empty results list when a search is sent that won't return any details" do
    client = XIVAPI::Client.new
    page = client.character_search CHARACTER_NAME, "Shiva"
    page.results.size.should eq 0
  end

  it "reads a Character properly with all extra data requested" do
    client = XIVAPI::Client.new
    # Include an invalid data field just to test
    character_response = client.character CHARACTER_ID, XIVAPI::Client::CHARACTER_DATA_VALUES

    # Check that the Character returned is the right one
    character_response.character.name.should eq CHARACTER_NAME
    character_response.character.server.should contain CHARACTER_SERVER

    # Ensure the extra requested data is not nil
    character_response.achievements.should_not be_nil
    character_response.free_company.should_not be_nil
    character_response.free_company_members.should_not be_nil
    character_response.minions.should_not be_nil
    character_response.mounts.should_not be_nil
    character_response.character.active_class_job.should_not be_nil
    # PvpTeam never seems to work for me so idk
  end

  it "can verify a Character" do
    client = XIVAPI::Client.new
    verification = client.character_verification CHARACTER_ID, "-"
    verification.should eq true
  end
end
