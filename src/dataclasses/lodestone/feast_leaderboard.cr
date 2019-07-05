require "json"

module XIVAPI
  module Dataclasses
    # A Dataclass for the Feast Leaderboard data from the Lodestone.
    class FeastLeaderboard
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        matches: {type: String, key: "Matches"},
        rank: {type: UInt64, key: "Rank"},
        rank_image: {type: String, key: "RankImage"},
        prev_rank: {type: String, key: "RankPrevious"},
        rating: {type: UInt64, key: "Rating"},
        win_count: {type: String, key: "WinCount"},
        win_rate: {type: String, key: "WinRate"},
      )
      # The number of matches that were played.
      getter matches
      # The Character's current rank.
      getter rank
      # URL for the image of the Character's current rank.
      getter rank_image
      # The Character's previous rank.
      # I assume this is their rank in the previous Feast?
      getter prev_rank
      # The current rating for the Character.
      getter rating
      # The current win count for the Character.
      getter win_count
      # The current win rate for the Character.
      getter win_rate
    end
  end
end
