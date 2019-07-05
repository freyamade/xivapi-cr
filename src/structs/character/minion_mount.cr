require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct MinionMount
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        icon_small: {type: String, key: "IconSmall"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
      )
      # The ID of the Minion or Mount.
      getter id
      # The URL of the icon for the Minion or Mount.
      getter icon
      # The URL of the small icon for the Minion or Mount.
      getter icon_small
      # The name of the Minion or Mount.
      getter name
      # The XIVAPI URL for the Minion or Mount.
      getter url
    end
  end
end
