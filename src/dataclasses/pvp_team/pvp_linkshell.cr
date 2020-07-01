require "json"
require "./pvp_team_profile"
require "../character/character_summary"
require "../other/pagination"

module XIVAPI
  module Dataclasses
    # Dataclass for the Linkshell data for the PvP Team response.
    class PvpLinkshell
      include JSON::Serializable
      # An `Pagination` class containing the pagination info for the request.
      @[JSON::Field(key: "Pagination")]
      getter pagination : Pagination
      # A `PvpTeamProfile` class containing data about the PvP Team's Profile.
      @[JSON::Field(key: "Profile")]
      getter profile : PvpTeamProfile
      # An Array of `CharacterSummary` classs representing the Characters in the Linkshell for the PvP Team.
      @[JSON::Field(key: "Results")]
      getter results : Array(CharacterSummary)
    end
  end
end
