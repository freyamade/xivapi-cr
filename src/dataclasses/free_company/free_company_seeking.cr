require "json"

module XIVAPI
  module Dataclasses
    # A class representing the items in the focus or seeking list of a Free Company.
    class FreeCompanySeeking
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        status: {type: Bool, key: "Status"}
      )
      # URL of the icon for the focus item.
      getter icon
      # The name of the focus item.
      getter name
      # A flag stating whether or not the Free Company is focusing on the item.
      getter status
    end
  end
end
