require "json"
require "../character/character_summary"
require "../other/pagination"
require "../utils/name"

module XIVAPI
  module Dataclasses
    # Dataclass for the details of a Linkshell.
    class Linkshell
      include JSON::Serializable
      # The ID of the Linkshell
      @[JSON::Field(key: "ID")]
      getter id : String
      # An Array of `CharacterSummary`instances representing the Characters in the Linkshell.
      @[JSON::Field(key: "Results")]
      getter results : Array(CharacterSummary)
    end
  end
end
