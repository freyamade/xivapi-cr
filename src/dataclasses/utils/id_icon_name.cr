require "json"

module XIVAPI
  module Dataclasses
    # A class for a simple combination of ID, icon and name.
    # Used throughout the library in places that need this simple mapping.
    class IDIconName
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
      )
      # The ID of the item.
      getter id
      # URL to the icon of the item.
      getter icon
      # The name of item.
      getter name
    end
  end
end