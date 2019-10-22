require "json"
require "./linkshell"

module XIVAPI
  module Dataclasses
    # Dataclass for the response from the Linkshell read View.
    class LinkshellResponse
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        linkshell: {type: Linkshell, key: "Linkshell"},
      )
      # A `Linkshell` object representing the data on the chosen Linkshell.
      getter linkshell
    end
  end
end
