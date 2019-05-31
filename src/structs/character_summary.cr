require "json"

module XIVAPI
  module Structs
    # Struct for summary of character data
    struct CharacterSummary
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        avatar: {type: String?, key: "Avatar"},
        feast_matches: {type: Int32?, key: "FeastMatches"},
        id: {type: Int32?, key: "ID"},
        name: {type: String?, key: "Name"},
        rank: {type: String?, key: "Rank"},
        rank_icon: {type: String?, key: "RankIcon"},
        server: {type: String?, key: "Server"}
      )
      # url to the image used for the avatar of the character
      getter avatar
      # number of feast matches
      getter feast_matches
      # the XIVAPI ID for the character
      getter id
      # the name of the character
      getter name
      # the rank of the character if this is in the FreeCompanyMembers Array
      getter rank
      # url to the image used for the icon for the rank
      getter rank_icon
      # the name of the server the character is on
      getter servers
    end
  end
end
