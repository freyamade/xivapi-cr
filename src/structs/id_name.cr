require "json"

module XIVAPI
  module Structs
    # Struct for an id, name combination
    struct IDName
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64?, key: "ID"},
        name: {type: String?, key: "Name"},
      )
      # the ID
      getter id
      # the Name
      getter name
    end
  end
end
