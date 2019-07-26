require "json"
require "./lodestone"

module XIVAPI
  module Dataclasses
    # A Dataclass for the Deep Dungeon Leaderboard data from the Lodestone.
    class DeepDungeonLeaderboard
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        floor: {type: UInt64, key: "Floor"},
        rank: {type: UInt64, key: "Rank"},
        score: {type: UInt64, key: "Score"},
        time: {type: Time, key: "Time", converter: Time::EpochConverter},
      )
      # The floor that the Character reached.
      getter floor
      # The Character's rank in the leaderboard.
      getter rank
      # The Character's total score.
      getter score
      # Timestamp of when the run was completed.
      getter time
    end
  end
end
