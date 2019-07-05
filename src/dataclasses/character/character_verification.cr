require "json"

module XIVAPI
  module Dataclasses
    # Dataclass representing the response from the Character verification endpoint.
    class CharacterVerification
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        bio: {type: String, key: "Bio"},
        id: {type: UInt64, key: "ID"},
        pass: {type: Bool, key: "Pass"}
      )
      # The Lodestone bio of the chosen Character.
      getter bio
      # The Lodestone ID of the chosen Character.
      getter id
      # If a token is passed in the request, this will be true if the Character's bio contains the token.
      getter pass
    end
  end
end
