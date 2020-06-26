require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for data that just contains a Name value.
    class Name
      include JSON::Serializable
      # The name associated with the data.
      @[JSON::Field(key: "Name")]
      getter name : String
    end

    # Dataclass for data that just contains a Name value, but with a lowercase 'n' for the key name.
    class NameLowcase
      include JSON::Serializable
      # The name associated with the data.
      getter name
    end
  end
end
