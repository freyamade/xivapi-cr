require "json"
require "./pvp_team_profile"
require "../character/character_summary"
require "../other/pagination"

module XIVAPI
  module Structs
    # Struct for the Linkshell data for the PvP Team response.
    struct PvPLinkshell
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        pagination: {type: Pagination, key: "Pagination"},
        profile: {type: PvpTeamProfile, key: "Profile"},
        results: {type: Array(CharacterSummary), key: "Results"},
      )
      # An `Pagination` struct containing the pagination info for the request.
      getter pagination
      # A `PvpTeamProfile` struct containing data about the PvP Team's Profile.
      getter profile
      # An Array of `CharacterSummary` structs representing the Characters in the Linkshell for the PvP Team.
      getter results
    end
  end
end
