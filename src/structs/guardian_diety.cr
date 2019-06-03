require "json"

module XIVAPI
  module Structs
    # Struct for your guardian deity
    struct GuardianDiety
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        guardian_deity: {type: String?, key: "GuardianDeity", converter: String::RawConverter},
        id: {type: Int32?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        name: {type: String?, key: "Name"},
        url: {type: String?, key: "Url"},
      )
      # guardian deity seems to always be null
      getter guardian_deity
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
