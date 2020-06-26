require "json"

module XIVAPI
  module Dataclasses
    # A class for a simple combination of ID, and name.
    # Used throughout the library in places that need this simple mapping.
    class IDName
      include JSON::Serializable
      # The ID of the item.
      @[JSON::Field(key: "ID")]
      getter id : UInt64?
      # URL to the icon of the item.
      getter icon
    end
  end
end
