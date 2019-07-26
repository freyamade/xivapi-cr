require "json"
require "../other/info"

module XIVAPI
  module Dataclasses
    # Dataclass that contains the `Info` class for the Linkshell request.
    class LinkshellInfo
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        linkshell: {type: Info, key: "Linkshell"},
      )
      # `Info` class containing the Info for the request.
      getter linkshell
    end
  end
end
