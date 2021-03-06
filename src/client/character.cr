require "./client"

module XIVAPI
  module Client::Character
    # In this file, add methods for retrieving Character data

    # A Set of Strings representing the fields that can be requested using the Character endpoint
    CHARACTER_DATA_VALUES = Set{"AC", "FR", "FC", "FCM", "PVP", "MIMO", "CJ"}

    # Search the lodestone API for characters with a given name.
    # Optionally, search specific servers, add request extra fields.
    def character_search(name : String, server : String = "", page : UInt32 = 1) : Dataclasses::Page(Dataclasses::CharacterSummary)
      # Send a request to the API for character data, sending the passed parameters along with it
      endpoint = "character/search"
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request endpoint, params
      begin
        return Dataclasses::Page(Dataclasses::CharacterSummary).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve the details of the Character with the given Lodestone ID.
    # Any data fields that are requested will be mapped against the `CHARACTER_DATA_VALUES` variable to ensure only allowed values are sent.
    def character(id : UInt64, data : Enumerable(String) = [] of String) : Dataclasses::CharacterResponse
      # Reject any items in `data` not in the allowed array of items
      data = data.reject { |field| !CHARACTER_DATA_VALUES.includes? field.upcase }
      endpoint = "character/#{id}"
      response = request endpoint, {"data" => data.join ","}
      begin
        return Dataclasses::CharacterResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Verify the Character using a token.
    # This method checks that the given token is in the requested User's Bio
    def character_verification(id : UInt64, token : String) : Bool
      return character(id).character.bio.includes? token
    end
  end

  # When this file is required, include the Character module to have access to the commands
  class Client
    include Character
  end
end
