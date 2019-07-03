require "./client"

module XIVAPI
  class Client
    # In this file, add methods for polling Character data

    # Subset of ENDPOINT MAP in requests.cr pertaining to Character requests
    ENDPOINT_MAP = {
      "/character/search?name=First+Last&server=Server" => Structs::CharacterSearch, # Character data
      "/character/{id}"                                 => Structs::Character,
      "/character/{id}/verification"                    => Structs::Verification,
      "/character/{id}/update"                          => Int32,
    }

    # Search the lodestone API for characters with a given name.
    # Optionally, search specific servers and
    def character_search(name : String, server : String = "", page : UInt32 = 1) : Structs::Page(Structs::CharacterSearch)
      # Send a request to the API for character data, sending the passed parameters along with it
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request "/character/search", params
      return Structs::Page(Structs::CharacterSearch).from_json response
    end
  end
end
