require "json"
require "./deep_dungeon_leaderboard"
require "./lodestone_character"
require "../utils/name"

module XIVAPI
  module Structs
    # Struct for the response data from the Lodestone Deep Dungeon endpoint.
    struct DeepDungeon
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        character: {type: LodestoneCharacter, key: "Character"},
        class_job: {type: Name, key: "ClassJob"},
        leaderboard: {type: DeepDungeonLeaderboard, key: "Leaderboard"}
      )
      # A `LodestoneCharacter` struct containing the Character's information.
      getter character
      # A `Name` struct containing the information on the Character's Class / Job.
      getter class_job
      # A `DeepDungeonLeaderboard` struct containing the information on the Leaderboard placement of the Character.
      getter leaderboard
    end
  end
end
