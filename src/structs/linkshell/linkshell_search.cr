require "json"

module XIVAPI
  module Structs
    # Struct for the data returned from a Linkshell search.
    struct LinkshellSearch
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: String, key: "ID"},
        name: {type: String, key: "Name"},
        server: {type: String, key: "Server"},
      )
      # The ID of the Linkshell.
      getter id
      # The name of the Linkshell.
      getter name
      # The server that the Linkshell is on.
      getter server
    end
  end
end
