require "json"
require "./deep_dungeon"

module XIVAPI
  module Dataclasses
    # Dataclass for the response from the Lodestone Deep Dungeon endpoints.
    # Contains a single `results` key which is the array of `DeepDungeon` records.
    class DeepDungeonResponse
      JSON.mapping(
        results: {type: Array(DeepDungeon), key: "results"},
      )
      # The Array of Deep Dungeon results.
      getter results
    end
  end
end
