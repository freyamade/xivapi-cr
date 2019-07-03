require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct MinionMount
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        icon_small: {type: String?, key: "IconSmall"},
        name: {type: String?, key: "Name"},
        url: {type: String?, key: "Url"},
      )
      # the ID
      getter id
      # the Icon
      getter icon
      # the small Icon
      getter icon_small
      # the Name
      getter name
      # the Url
      getter url
    end
  end
end
