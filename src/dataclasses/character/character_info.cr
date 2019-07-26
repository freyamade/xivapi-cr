require "json"
require "../other/info"

module XIVAPI
  module Dataclasses
    # Dataclass for info about the availability of different data
    class CharacterInfo
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        achievements: {type: Info?, key: "Achievements"},
        character: {type: Info, key: "Character"},
        free_company: {type: Info?, key: "FreeCompany"},
        free_company_members: {type: Info?, key: "FreeCompanyMembers"},
        friends: {type: Info?, key: "Friends"},
        pvp_team: {type: Info?, key: "PvPTeam"}
      )
      # info about the achievements class
      getter achievements
      # info about the character class
      getter character
      # info about the free company class
      getter free_company
      # info about the list of character summaries of all free company members
      getter free_company_members
      # info about the list of character summaries of all friends
      getter friends
      # info about the pvp team class
      getter pvp_team
    end
  end
end
