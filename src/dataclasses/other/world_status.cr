require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for world status data
    class WorldStatus
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        status: {type: String, key: "Status"},
        title: {type: String, key: "Title"},
      )
      # String containing the current status of the world
      getter status
      # Name of the world
      getter title
    end
  end
end
