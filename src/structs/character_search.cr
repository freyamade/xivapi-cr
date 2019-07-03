require "json"

module XIVAPI
  module Structs
    # Struct for a character search
    struct CharacterSearch
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        avatar: {type: String, key: "Avatar"},
        feast_matches: {type: Int32, key: "FeastMatches"},
        id: {type: Int32, key: "ID"},
        name: {type: String, key: "Name"},
        rank: {type: String?, key: "Rank", converter: String::RawConverter},
        rank_icon: {type: String?, key: "RankIcon", converter: String::RawConverter},
        server: {type: String, key: "Server"},
      )
      # URL of the Character's Avatar
      getter avatar
      # The number of feast matches the character has played
      getter feast_matches
      # The lodestone ID of the character
      getter id
      # The Character's Name
      getter name
      # Unsure what this is, it's null for the characters I could find.
      # It will be returned as a String if it's not nil
      getter rank
      # Unsure what this is, it's null for the characters I could find.
      # It will be returned as a String if it's not nil
      getter rank_icon
      # The name of the Server the Character is on
      getter server
    end
  end
end
