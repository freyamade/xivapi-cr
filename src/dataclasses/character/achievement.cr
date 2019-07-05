require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for an Achievement
    class Achievement
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        date: {type: Time, key: "Date"},
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        points: {type: UInt64, key: "Points"},
      )
      # The timestamp of when the Achievement was achieved by the Character
      getter date
      # Lodestone ID of the achievement
      getter id
      # URL of the Achievement's Icon
      getter icon
      # Name of the Achievement
      getter name
      # The number of points the Achievement is worth
      getter points
    end
  end
end
