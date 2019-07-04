require "json"
require "./feast_leaderboard"
require "./lodestone_character"

module XIVAPI
  module Structs
    # Struct for the response data from the Lodestone Feast endpoint.
    struct Feast
      JSON.mapping(
        character: {type: LodestoneCharacter, key: "Character"},
        leaderboard: {type: FeastLeaderboard, key: "Leaderboard"},
      )
      # A `LodestoneCharacter` struct containing the Character's information.
      getter character
      # A `FeastLeaderboard` struct containing the information on the Leaderboard placement of the Character.
      getter leaderboard
    end
  end
end
