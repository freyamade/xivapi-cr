require "../spec_helper"

# Some Character detail constants that will be handy for the tests
CHARACTER_NAME   = "Erika Vaincannet"
CHARACTER_SERVER = "Lich"
CHARACTER_ID     = 22909725_u64

describe XIVAPI::Client do
  # Series of tests for the Character Client methods
  describe "Character" do
    it "successfully searches for Characters" do
      client = XIVAPI::Client.new
      page = client.character_search CHARACTER_NAME
      character = page.results[0]
      character.name.should eq CHARACTER_NAME
      character.server.should eq CHARACTER_SERVER
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
      character_response.character.server.should eq CHARACTER_SERVER

      # Ensure the extra requested data is not nil
      character_response.achievements.should_not be_nil
      character_response.free_company.should_not be_nil
      character_response.free_company_members.should_not be_nil
      character_response.info.achievements.should_not be_nil
      character_response.info.free_company.should_not be_nil
      character_response.info.free_company_members.should_not be_nil
      character_response.info.friends.should_not be_nil

      # Special handling for the Friends part since I keep my Friends private
      if character_response.info.friends.not_nil!.state.private?
        character_response.friends.should be_nil
      else
        character_response.friends.should_not be_nil
      end

      # PvpTeam never seems to work for me so idk
    end

    it "can verify a Character" do
      client = XIVAPI::Client.new
      verification = client.character_verification CHARACTER_ID
      verification.id.should eq CHARACTER_ID
    end

    it "can update a Character" do
      client = XIVAPI::Client.new
      updated = client.character_update CHARACTER_ID
      [0_i32, 1_i32].includes?(updated).should be_true
    end
  end
end
