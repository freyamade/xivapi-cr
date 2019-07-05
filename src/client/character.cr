require "./client"

module XIVAPI
  class Client
    # In this file, add methods for polling Character data

    # Search the lodestone API for characters with a given name.
    # Optionally, search specific servers.
    def character_search(name : String, server : String = "", page : UInt32 = 1) : Dataclasses::Page(Dataclasses::CharacterSummary)
      # Send a request to the API for character data, sending the passed parameters along with it
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request "character/search", params
      return Dataclasses::Page(Dataclasses::CharacterSummary).from_json response
    end

    # Retrieve the details of the Character with the given Lodestone ID.
    # For now, sends a flag to retrieve extended character data from the API.
    def character(id : UInt64) : Dataclasses::CharacterResponse
      endpoint = "character/#{id}"
      response = request endpoint
      return Dataclasses::CharacterResponse.from_json response
    end

    # Verify the Character using a token.
    # This method returns the Character's Bio and a `pass` flag that states if the supplied token was found in their bio
    def character_verification(id : UInt64, token : String = "") : Dataclasses::CharacterVerification
      endpoint = "character/#{id}/verification"
      response = request endpoint, {"token" => token}
      return Dataclasses::CharacterVerification.from_json response
    end

    # Send a request to update the Character with the given ID.
    # A response of 0 indicates that the Character cannot be updated at this time, and a response of 1 indicates a successful request.
    def character_update(id : UInt64) : Int32
      endpoint = "character/#{id}/update"
      response = request endpoint
      return response.to_i
    end
  end
end
