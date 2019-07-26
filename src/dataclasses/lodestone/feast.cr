require "json"
require "./feast_leaderboard"
require "./lodestone_character"

module XIVAPI
  module Dataclasses
    # Dataclass for the response data from the Lodestone Feast endpoint.
    class Feast
      JSON.mapping(
        character: {type: LodestoneCharacter, key: "Character"},
        leaderboard: {type: FeastLeaderboard, key: "Leaderboard"},
      )
      # A `LodestoneCharacter` class containing the Character's information.
      getter character
      # A `FeastLeaderboard` class containing the information on the Leaderboard placement of the Character.
      getter leaderboard
    end
  end
end
