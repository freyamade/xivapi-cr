require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Reputation
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        name: {type: String?, key: "Name"},
        progress: {type: Int32?, key: "Progress"},
        rank: {type: String?, key: "Rank"},
      )
      # the name of the grand company with which this reputation is
      getter name
      # the progress towards the next rank of reputation
      getter progress
      # the rank of reputation with the grand company
      getter reputation
    end
  end
end
