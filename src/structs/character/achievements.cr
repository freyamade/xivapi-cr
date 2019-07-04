require "json"
require "./achievement"

module XIVAPI
  module Structs
    # Struct for a list of all Achievements earned by a Character, plus some metadata about the list itself.
    struct Achievements
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        list: {type: Array(Structs::Achievement), key: "List"},
        parse_date: {type: Time, key: "ParseDate", converter: Time::EpochConverter},
        points: {type: UInt64, key: "Points"}
      )
      # A list of `Achievement` structs that have been achieved by the Character
      getter list
      # The timestamp of the last parse of the Achievement list for the Character
      getter parse_date
      # The total number of Achievement points the Character has
      getter points
    end
  end
end
