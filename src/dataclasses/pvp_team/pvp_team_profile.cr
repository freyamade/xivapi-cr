require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing data for a PVP Team's Profile.
    class PvpTeamProfile
      # define a JSON mapping to create instances of this class
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
