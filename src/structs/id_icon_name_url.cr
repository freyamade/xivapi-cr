require "json"

module XIVAPI
  module Structs
    # Struct for a id, icon, name, url combination
    struct IDIconNameUrl
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: Int32?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        name: {type: String?, key: "Name"},
        url: {type: String?, key: "Url"},
      )
      # the ID
      getter id
      # the Icon
      getter icon
      # the Name
      getter name
      # the Url
      getter url
    end
  end
end
