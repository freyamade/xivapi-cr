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
      endpoint = "/character/#{id}?extended=1"
      response = request endpoint
      return Structs::Character.from_json response
    end
  end
end
