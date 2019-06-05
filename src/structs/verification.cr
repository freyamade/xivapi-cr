require "json"

module XIVAPI
  module Structs
    # Struct for a character verification
    struct Verification
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        bio: {type: String?, key: "Bio"},
        id: {type: Int32?, key: "ID"},
        pass: {type: Bool?, key: "Pass"}
      )
      # the character's bio
      getter bio
      # the character's id
      getter id
      # if a token is passed this will be true in the case of a match
      getter pass
    end
  end
end
