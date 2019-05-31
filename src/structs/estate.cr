require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Estate
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        greeting: {type: String?, key: "Greeting"},
        name: {type: String?, key: "Name"},
        plot: {type: String?, key: "Plot"},
      )
      # the greeting of the estate
      getter greeting
      # the name of the estate
      getter name
      # the plot of the estate
      getter plot
    end
  end
end
