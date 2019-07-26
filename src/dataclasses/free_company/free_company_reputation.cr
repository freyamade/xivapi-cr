require "json"

module XIVAPI
  module Dataclasses
    # A class for the reputation data for a Free Company.
    class FreeCompanyReputation
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        name: {type: String, key: "Name"},
        progress: {type: UInt64, key: "Progress"},
        rank: {type: String, key: "Rank"},
      )
      # The name of the Grand Company the reputation value is for.
      getter name
      # The progress value towards the next rank of reputation.
      getter progress
      # The current reputation rank with the Grand Company.
      getter reputation
    end
  end
end
