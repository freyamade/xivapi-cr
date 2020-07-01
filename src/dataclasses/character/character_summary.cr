require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing minimal data about a Character.
    # This class is used during Character searches, as well as used to represent Character's in another Character's Friend List or Free Company Member List.
    class CharacterSummary
      include JSON::Serializable
      # URL of the Character's Avatar.
      @[JSON::Field(key: "Avatar")]
      getter avatar : String
      # The number of feast matches the character has played.
      @[JSON::Field(key: "FeastMatches")]
      getter feast_matches : UInt64
      # The Lodestone ID of the character.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # The Character's Name.
      @[JSON::Field(key: "Name")]
      getter name : String
      # Unsure what this is, it's null for the characters I could find.
      # It will be returned as a String if it's not nil.
      @[JSON::Field(key: "Rank", converter: String::RawConverter)]
      getter rank : String?
      # Unsure what this is, it's null for the characters I could find.
      # It will be returned as a String if it's not nil.
      @[JSON::Field(key: "RankIcon", converter: String::RawConverter)]
      getter rank_icon : String?
      # The name of the Server the Character is currently on.
      @[JSON::Field(key: "Server")]
      getter server : String
    end
  end
end
