require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for world status data
    class WorldStatus
      include JSON::Serializable
      # String containing the current status of the world
      @[JSON::Field(key: "Status")]
      getter status : String
      # Name of the world
      @[JSON::Field(key: "Title")]
      getter title : String
    end
  end
end
