require "json"

module XIVAPI
  module Structs
    # Struct containing data for a PVP Team's Profile.
    struct PvpTeamProfile
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        crest: {type: Array(String), key: "Crest"},
        name: {type: String, key: "Name"},
        server: {type: String, key: "Server"},
      )
      # An Array of URLs to the images that make up the Team's crest.
      getter crest
      # The name of the Team.
      getter name
      # The name of the server that the team is on.
      getter server
    end
  end
end
