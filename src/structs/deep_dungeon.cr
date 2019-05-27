require "json"
require "./lodestone"

module XIVAPI
  module Structs
    # Struct for Deep Dungeon Leaderboard data
    struct DeepDungeonLeaderboard
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        floor: {type: Int32, key: "Floor"},
        rank: {type: Int32, key: "Rank"},
        score: {type: UInt32, key: "Score"},
        time: {type: Time, key: "Time", converter: Time::EpochConverter},
      )
      # The floor that the character reached
      getter floor
      # The character's rank in the leaderboard
      getter rank
      # The character's score
      getter score
      # The time at which the character finished the run
      getter time
    end

    # Struct representing the class or job used in the run of the dungeon
    struct DeepDungeonClassJob
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        name: {type: String, key: "Name"},
      )
      # The name of the class or job
      getter name
    end

    # Struct for Deep Dungeon Response Data
    struct DeepDungeon
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        character: {type: LodestoneCharacter, key: "Character"},
        class_job: {type: DeepDungeonClassJob, key: "ClassJob"},
        leaderboard: {type: DeepDungeonLeaderboard, key: "Leaderboard"}
      )
      # Information about the Character
      getter character
      # The class or job used by the Character
      getter class_job
      # Leaderboard Information
      getter leaderboard
    end
  end
end
