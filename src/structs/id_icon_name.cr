require "json"

module XIVAPI
  module Structs
    # Struct for an id, name combination
    struct IDIconName
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        name: {type: String?, key: "Name"},
      )
      # the ID
      getter id
      # the Icon
      getter icon
      # the Name
      getter name
    end
  end
end
