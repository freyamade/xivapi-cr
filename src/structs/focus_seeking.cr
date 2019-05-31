require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct FocusSeeking
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        icon: {type: String?, key: "Icon"},
        name: {type: String?, key: "Name"},
        status: {type: Bool?, key: "Status"}
      )
      # the url of the icon for the focus
      getter icon
      # the name of the focus
      getter name
      # the status of the focus
      getter status
    end
  end
end
