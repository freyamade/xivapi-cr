require "json"

module XIVAPI
  module Structs
    # Struct for a pvp team's profile
    struct Profile
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        crest: {type: Array(String)?, key: "Crest"},
        name: {type: String?, key: "Name"},
        server: {type: String?, key: "Server"},
      )
      # array of urls to the images used to make the crest of the pvp team
      getter crest
      # the name of the pvp team
      getter name
      # the name of the server of the pvp team
      getter server
    end
  end
end
