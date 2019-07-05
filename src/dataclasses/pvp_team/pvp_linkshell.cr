require "json"
require "./pvp_team_profile"
require "../character/character_summary"
require "../other/pagination"

module XIVAPI
  module Dataclasses
    # Dataclass for the Linkshell data for the PvP Team response.
    class PvpLinkshell
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        pagination: {type: Pagination, key: "Pagination"},
        profile: {type: PvpTeamProfile, key: "Profile"},
        results: {type: Array(CharacterSummary), key: "Results"},
      )
      # An `Pagination` class containing the pagination info for the request.
      getter pagination
      # A `PvpTeamProfile` class containing data about the PvP Team's Profile.
      getter profile
      # An Array of `CharacterSummary` classs representing the Characters in the Linkshell for the PvP Team.
      getter results
    end
  end
end
