require "json"

module XIVAPI
  module Structs
    # A struct for a simple combination of ID, and name.
    # Used throughout the library in places that need this simple mapping.
    struct IDName
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64?, key: "ID"},
        name: {type: String?, key: "Name"},
      )
      # The ID of the item.
      getter id
      # URL to the icon of the item.
      getter icon
    end
  end
end
