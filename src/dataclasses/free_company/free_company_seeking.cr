require "json"

module XIVAPI
  module Dataclasses
    # A class representing the items in the focus or seeking list of a Free Company.
    class FreeCompanySeeking
      include JSON::Serializable
      # URL of the icon for the focus item.
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # The name of the focus item.
      @[JSON::Field(key: "Name")]
      getter name : String
      # A flag stating whether or not the Free Company is focusing on the item.
      @[JSON::Field(key: "Status")]
      getter status : Bool
    end
  end
end
