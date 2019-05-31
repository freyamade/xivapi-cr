require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct InfoData
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        is_active: {type: Bool?, key: "IsActive"},
        priority: {type: Int32?, key: "Priority"},
        state: {type: Int32?, key: "State"},
        updated: {type: Time?, key: "Updated", converter: Time::EpochConverter}
      )
      # whether or not the data is available
      getter is_active
      # the priority of the data
      getter priority
      # the state of the data
      getter state
      # the time the data was last updated at
      getter updated
    end
  end
end
