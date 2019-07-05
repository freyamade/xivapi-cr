require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for data that just contains a Name value.
    class Name
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        name: {type: String, key: "Name"},
      )
      # The name associated with the data.
      getter name
    end

    # Dataclass for data that just contains a Name value, but with a lowercase 'n' for the key name.
    class NameLowcase
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        name: String,
      )
      # The name associated with the data.
      getter name
    end
  end
end
