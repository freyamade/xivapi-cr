require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for the data returned from a Linkshell search.
    class LinkshellSearch
      include JSON::Serializable
      # The ID of the Linkshell.
      @[JSON::Field(key: "ID")]
      getter id : String
      # The name of the Linkshell.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The server that the Linkshell is on.
      @[JSON::Field(key: "Server")]
      getter server : String
    end
  end
end
