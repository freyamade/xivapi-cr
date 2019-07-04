require "json"

module XIVAPI
  module Structs
    # Struct containing details about a Free Company Estate.
    struct Estate
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        greeting: {type: String, key: "Greeting"},
        name: {type: String, key: "Name"},
        plot: {type: String, key: "Plot"},
      )
      # The greeting message for the Estate.
      getter greeting
      # The Estate's name.
      getter name
      # The Estate's plot details.
      getter plot
    end
  end
end
