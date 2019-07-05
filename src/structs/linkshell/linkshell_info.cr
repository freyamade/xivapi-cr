require "json"
require "../other/info"

module XIVAPI
  module Structs
    # Struct that contains the `Info` struct for the Linkshell request.
    struct LinkshellInfo
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        linkshell: {type: Info, key: "Linkshell"},
      )
      # `Info` struct containing the Info for the request.
      getter linkshell
    end
  end
end
