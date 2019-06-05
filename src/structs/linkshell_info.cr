require "json"

module XIVAPI
  module Structs
    # Struct for linkshell info
    struct LinkshellInfo
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        linkshell: {type: Structs::InfoData?, key: "Linkshell"},
      )
      # info about the availability of linkshell data
      getter linkshell
    end
  end
end
