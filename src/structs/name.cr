require "json"
require "./lodestone"

module XIVAPI
  module Structs
    # Struct for data that just contains a Name value.
    struct DeepDungeonClassJob
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        name: {type: String, key: "Name"},
      )
      # The name associated with the data.
      getter name
    end
  end
end
