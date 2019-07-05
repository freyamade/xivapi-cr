require "json"

module XIVAPI
  module Structs
    # A struct representing a PvP Team.
    struct PvpTeam
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        avatar: {type: String, key: "Avatar"},
        feast_matches: {type: UInt64, key: "FeastMatches"},
        id: {type: UInt64, key: "ID"},
        name: {type: String, key: "Name"},
        rank: {type: String, key: "Rank"},
        rank_icon: {type: String, key: "RankIcon"},
        server: {type: String, key: "Server"},
      )
      # URL for the avatar for the PvP Team.
      getter avatar
      # The number of feast matches that the PvP Team have played.
      getter feast_matches
      # The ID of the PvP Team.
      getter id
      # The name of the PvP Team.
      getter name
      # The rank of the PvP Team.
      getter rank
      # URL to the icon of the Pvp Team's rank.
      getter rank_icon
      # The name of the server that the PvP Team is on.
      getter server
    end
  end
end
