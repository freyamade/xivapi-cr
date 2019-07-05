require "json"

module XIVAPI
  module Structs
    # A struct for a simple combination of ID, name, and URL.
    # Used throughout the library in places that need this simple mapping.
    struct IDNameUrl
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64, key: "ID"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
      )
      # The ID of the item.
      getter id
      # The name of item.
      getter name
      # The URL of the item in XIVAPI.
      getter url
    end
  end
end
