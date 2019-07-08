require "./client"

module XIVAPI
  class Client
    # In this file, add methods for retrieving Character data

    # A Set of Strings representing the fields that can be requested using the Character endpoint
    CHARACTER_DATA_VALUES = Set{"AC", "FR", "FC", "FCM", "PVP"}

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
    # Any data fields that are requested will me mapped against the `CHARACTER_DATA_VALUES` variable to ensure only allowed values are sent.
    def character(id : UInt64, data : Array(String) = [] of String) : Dataclasses::CharacterResponse
      # Reject any items in `data` not in the allowed array of items
      data.reject! { |field| !CHARACTER_DATA_VALUES.includes? field.upcase }
      endpoint = "character/#{id}"
      response = request endpoint, {"data" => data.join ","}
      begin
        return Dataclasses::CharacterResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Verify the Character using a token.
    # This method returns the Character's Bio and a `pass` flag that states if the supplied token was found in their bio
    def character_verification(id : UInt64, token : String = "") : Dataclasses::CharacterVerification
      endpoint = "character/#{id}/verification"
      response = request endpoint, {"token" => token}
      begin
        return Dataclasses::CharacterVerification.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Send a request to update the Character with the given ID.
    # A response of 0 indicates that the Character cannot be updated at this time, and a response of 1 indicates a successful request.
    def character_update(id : UInt64) : Int32
      endpoint = "character/#{id}/update"
      response = request endpoint
      begin
        return response.to_i
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end
end
