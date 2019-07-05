require "json"
require "./achievement"

module XIVAPI
  module Dataclasses
    # Dataclass for a list of all Achievements earned by a Character, plus some metadata about the list itself.
    class Achievements
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        list: {type: Array(Achievement), key: "List"},
        parse_date: {type: Time, key: "ParseDate", converter: Time::EpochConverter},
        points: {type: UInt64, key: "Points"}
      )
      # A list of `Achievement` classs that have been achieved by the Character
      getter list
      # The timestamp of the last parse of the Achievement list for the Character
      getter parse_date
      # The total number of Achievement points the Character has
      getter points
    end
  end
end
