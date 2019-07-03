require "json"

module XIVAPI
  module Structs
    # Struct for an id, name, url combination
    struct IDNameUrl
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64?, key: "ID"},
        name: {type: String?, key: "Name"},
        url: {type: String?, key: "Url"},
      )
      # the ID
      getter id
      # the Name
      getter name
      # the Url
      getter url
    end
  end
end
