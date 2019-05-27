require "json"
require "./lodestone"

module XIVAPI
  module Structs
    # Struct for Leaderboard details from the feasts endpoint
    struct FeastLeaderboard
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        matches: {type: String, key: "Matches"},
        rank: {type: Int32, key: "Rank"},
        rank_image: {type: String, key: "RankImage"},
        prev_rank: {type: String, key: "RankPrevious"},
        rating: {type: Int32, key: "Rating"},
        win_count: {type: String, key: "WinCount"},
        win_rate: {type: String, key: "WinRate"},
      )
      # The matches that were played
      getter matches
      # The player's current rank
      getter rank
      # The image for the player's rank
      getter rank_image
      # The previous rank the player held
      getter prev_rank
      # The player's current rating
      getter rating
      # The player's current win count
      getter win_count
      # The player's current win rate
      getter win_rate
    end

    # Struct that makes up the elements in the array returned by the feasts endpoint
    struct Feast
      JSON.mapping(
        character: {type: LodestoneCharacter, key: "Character"},
        leaderboard: {type: FeastLeaderboard, key: "Leaderboard"},
      )
      # Information about the Character
      getter character
      # Leaderboard Information
      getter leaderboard
    end
  end
end
