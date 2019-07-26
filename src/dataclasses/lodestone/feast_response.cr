require "json"
require "./feast"

module XIVAPI
  module Dataclasses
    # Dataclass for the response from the Lodestone Feast endpoint.
    # Contains a single `results` key which is the array of `Feast` records.
    class FeastResponse
      JSON.mapping(
        results: {type: Array(Feast), key: "Results"},
      )
      # The Array of Feast results.
      getter results
    end
  end
end
