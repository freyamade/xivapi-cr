require "json"
require "../character/character_summary"
require "../other/pagination"
require "../utils/name"

module XIVAPI
  module Dataclasses
    # Dataclass for the details of a Linkshell.
    class Linkshell
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        id: {type: String, key: "ID"},
        pagination: {type: Pagination, key: "Pagination"},
        profile: {type: Name, key: "Profile"},
        results: {type: Array(CharacterSummary), key: "Results"},
      )
      # The ID of the Linkshell
      getter id
      # An Array of `CharacterSummary`instances representing the Characters in the Linkshell.
      getter results
    end
  end
end
