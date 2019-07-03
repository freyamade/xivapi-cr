require "json"

module XIVAPI
  module Structs
    # Struct for a pvp team result
    struct PvPTeamResult
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        avatar: {type: String?, key: "Avatar"},
        feast_matches: {type: Int32?, key: "FeastMatches"},
        id: {type: UInt64?, key: "ID"},
        name: {type: String?, key: "Name"},
        rank: {type: String?, key: "Rank"},
        rank_icon: {type: String?, key: "RankIcon"},
        server: {type: String?, key: "Server"},
      )
      # url to the avatar of the player
      getter avatar
      # the number of feast matches
      getter feast_matches
      # the id of the result
      getter id
      # the name of the player
      getter name
      # the rank of the player
      getter rank
      # url to the icon of the rank
      getter rank_icon
      # the name of the server
      getter server
    end
  end
end
