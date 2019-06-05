require "json"

module XIVAPI
  module Structs
    # Struct for a linkshell
    struct LS
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        linkshell: {type: Array(Structs::CharacterSummary)?, key: "Linkshell"},
        info: {type: Structs::LinkshellInfo?, key: "Info"},
      )
      # info about the linkshell
      getter linkshell
      # info about the availability of data
      getter info
    end
  end
end
