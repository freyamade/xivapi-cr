require "json"

module XIVAPI
  module Dataclasses
    # A class representing a PvP Team.
    class PvpTeam
      include JSON::Serializable
      # URL for the avatar for the PvP Team.
      @[JSON::Field(key: "Avatar")]
      getter avatar : String
      # The number of feast matches that the PvP Team have played.
      @[JSON::Field(key: "FeastMatches")]
      getter feast_matches : UInt64
      # The ID of the PvP Team.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # The name of the PvP Team.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The rank of the PvP Team.
      @[JSON::Field(key: "Rank")]
      getter rank : String
      # URL to the icon of the Pvp Team's rank.
      @[JSON::Field(key: "RankIcon")]
      getter rank_icon : String
      # The name of the server that the PvP Team is on.
      @[JSON::Field(key: "Server")]
      getter server : String
    end
  end
end
