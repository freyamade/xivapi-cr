require "json"
require "./achievements"
require "./character"
require "./character_summary"
require "../free_company"
require "../pvp_team"

module XIVAPI
  module Dataclasses
    # A class used to map out the response from the Character endpoint.
    # Currently, this class contains the entire data using the `extended=1` flag, but columns are still specifiable for the requests.
    class CharacterResponse
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        achievements: {type: Achievements?, key: "Achievements"},
        character: {type: Character, key: "Character"},
        free_company: {type: FreeCompany?, key: "FreeCompany"},
        free_company_members: {type: Array(CharacterSummary)?, key: "FreeCompanyMembers"},
        friends: {type: Array(CharacterSummary)?, key: "Friends"},
        pvp_team: {type: PvpTeam?, key: "PvPTeam"}
      )
      # An `Achievements` class containing all of the Character's Achievements data.
      # Will be `nil` unless the Achievements data (AC) is requested.
      getter achievements
      # A `CharacterData` class containing the actual data about the Character.
      getter character
      # A `FreeCompany` class representing the Character's Free Company.
      # Will be `nil` unless the Free Company data (FC) is requested, or if it is not yet in the system.
      getter free_company
      # An Array of `CharacterSummary` classs with details about the members of the Character's Free Company.
      # Will be `nil` unless the Free Company Members data (FCM) is requested, or if it is not yet in the system.
      getter free_company_members
      # An Array of `CharacterSummary` classs with details about the Character's friends.
      # Will be `nil` unless the Friends List data (FR) is requested.
      getter friends
      # A `PvpTeam` class representing the Character's PVP Team.
      # Will be `nil` unless the PVP Team data (PVP) is requested, or if it is not yet in the system.
      getter pvp_team
    end
  end
end
