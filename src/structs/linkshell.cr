require "json"

module XIVAPI
  module Structs
    # Struct for a linkshell
    struct Linkshell
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: String?, key: "ID"},
        name: {type: String?, key: "Name"},
        server: {type: String?, key: "Server"},
      )
      # the ID
      getter id
      # the Name
      getter name
      # the Server
      getter server
    end
  end
end
