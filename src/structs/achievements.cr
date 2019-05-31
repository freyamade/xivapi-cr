require "json"

module XIVAPI
  module Structs
    # Struct for all achievements of a character
    struct Achievements
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        list: {type: Array(Structs::Achievement)?, key: "List"},
        parse_date: {type: Time?, key: "ParseDate", converter: Time::EpochConverter},
        points: {type: Int32?, key: "Points"}
      )
      # the info about the attribute
      getter attribute
      # the value of the attribute
      getter value
    end
  end
end