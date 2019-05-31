require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Attribute
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        attribute: {type: Structs::IDName?, key: "Attribute"},
        value: {type: Int32?, key: "Value"},
      )
      # the info about the attribute
      getter attribute
      # the value of the attribute
      getter value
    end
  end
end