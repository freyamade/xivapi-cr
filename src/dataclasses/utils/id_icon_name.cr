require "json"

module XIVAPI
  module Dataclasses
    # A class for a simple combination of ID, icon and name.
    # Used throughout the library in places that need this simple mapping.
    class IDIconName
      include JSON::Serializable
      # The ID of the item.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # URL to the icon of the item.
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # The name of item.
      @[JSON::Field(key: "Name")]
      getter name : String
    end
  end
end
