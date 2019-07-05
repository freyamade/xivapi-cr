require "json"

module XIVAPI
  module Structs
    # Struct for data that just contains a Name value.
    struct Name
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        name: {type: String, key: "Name"},
      )
      # The name associated with the data.
      getter name
    end

    # Struct for data that just contains a Name value, but with a lowercase 'n' for the key name.
    struct NameLowcase
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        name: String,
      )
      # The name associated with the data.
      getter name
    end
  end
end
