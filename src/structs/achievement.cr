require "json"

module XIVAPI
  module Structs
    # Struct for an achievement
    struct Achievement
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        date: {type: Time?, key: "Date"},
        id: {type: Int32?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        name: {type: String?, key: "Name"},
        points: {type: Int32?, key: "Points"},
      )
      # the date when the achievement was acheived
      getter date
      # the ID
      getter id
      # the Icon
      getter icon
      # the Name
      getter name
      # the points given by the achievement
      getter points
    end
  end
end
