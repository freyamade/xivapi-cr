require "json"
require "./deep_dungeon_leaderboard"
require "./lodestone_character"
require "../utils/name"

module XIVAPI
  module Dataclasses
    # Dataclass for the response data from the Lodestone Deep Dungeon endpoint.
    class DeepDungeon
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        character: {type: LodestoneCharacter, key: "Character"},
        class_job: {type: Name, key: "ClassJob"},
        leaderboard: {type: DeepDungeonLeaderboard, key: "Leaderboard"}
      )
      # A `LodestoneCharacter` class containing the Character's information.
      getter character
      # A `Name` class containing the information on the Character's Class / Job.
      getter class_job
      # A `DeepDungeonLeaderboard` class containing the information on the Leaderboard placement of the Character.
      getter leaderboard
    end
  end
end
