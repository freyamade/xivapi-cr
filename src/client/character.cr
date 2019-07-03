require "./client"

module XIVAPI
  class Client
    # In this file, add methods for polling Character data

    # Subset of ENDPOINT MAP in requests.cr pertaining to Character requests
    ENDPOINT_MAP = {
      "/character/search?name=First+Last&server=Server" => Structs::CharacterSummary, # Character data
      "/character/{id}"                                 => Structs::Character,
      "/character/{id}/verification"                    => Structs::CharacterVerification,
      "/character/{id}/update"                          => Int32,
    }

    # Search the lodestone API for characters with a given name.
    # Optionally, search specific servers.
    def character_search(name : String, server : String = "", page : UInt32 = 1) : Structs::Page(Structs::CharacterSummary)
      # Send a request to the API for character data, sending the passed parameters along with it
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request "/character/search", params
      return Structs::Page(Structs::CharacterSummary).from_json response
    end

    # Retrieve the details of the Character with the given Lodestone ID.
    # For now, sends a flag to retrieve extended character data from the API.
    def character_read(id : UInt64) : Structs::Character
      endpoint = "/character/#{id}"
      response = request endpoint, {"extended" => "1"}
      return Structs::Character.from_json response
    end

    # Verify the Character using a token.
    # This method returns the Character's Bio and a `pass` flag that states if the supplied token was found in their bio
    def character_verify(id : UInt64, token : String = "") : Structs::CharacterVerification
      endpoint = "/character/#{id}/verification"
      response = request endpoint, {"token" => token}
      return Structs::CharacterVerification.from_json response
    end

    # Send a request to update the Character with the given ID.
    # A response of 0 indicates that the Character cannot be updated at this time, and a response of 1 indicates a successful request.
    def character_update(id : UInt64) : Int32
      endpoint = "/character/#{id}/update"
      response = request endpoint
      return response.to_i
    end
  end
end
