require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for an Achievement
    class Achievement
      include JSON::Serializable
      # The timestamp of when the Achievement was achieved by the Character
      @[JSON::Field(key: "Date", converter: Time::EpochConverter)]
      getter date : Time
      # Lodestone ID of the achievement
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # URL of the Achievement's Icon
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # Name of the Achievement
      @[JSON::Field(key: "Name")]
      getter name : String
      # The number of points the Achievement is worth
      @[JSON::Field(key: "Points")]
      getter points : UInt64
    end
  end
end
