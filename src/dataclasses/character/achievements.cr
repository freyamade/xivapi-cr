require "json"
require "./achievement"

module XIVAPI
  module Dataclasses
    # Dataclass for a list of all Achievements earned by a Character, plus some metadata about the list itself.
    class Achievements
      include JSON::Serializable
      # A list of `Achievement` classs that have been achieved by the Character
      @[JSON::Field(key: "List")]
      getter list : Array(Achievement)
      # The total number of Achievement points the Character has
      @[JSON::Field(key: "Points")]
      getter points : UInt64
    end
  end
end
