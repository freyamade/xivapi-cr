require "json"
require "./linkshell_info"
require "../character/character_summary"

module XIVAPI
  module Structs
    # Struct for the details of a Linkshell.
    struct Linkshell
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        linkshell: {type: Array(CharacterSummary), key: "Linkshell"},
        info: {type: LinkshellInfo, key: "Info"},
      )
      # An Array of `CharacterSummary`instances representing the Characters in the Linkshell.
      getter linkshell
      # An `Info` struct with details about the request.
      getter info
    end
  end
end
