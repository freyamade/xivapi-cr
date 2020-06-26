require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing data for a PVP Team's Profile.
    class PvpTeamProfile
      include JSON::Serializable
      # An Array of URLs to the images that make up the Team's crest.
      @[JSON::Field(key: "Crest")]
      getter crest : Array(String)
      # The name of the Team.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The name of the server that the team is on.
      @[JSON::Field(key: "Server")]
      getter server : String
    end
  end
end
