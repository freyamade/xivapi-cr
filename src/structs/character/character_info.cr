require "json"
require "../other/info"

module XIVAPI
  module Structs
    # Struct for info about the availability of different data
    struct CharacterInfo
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        achievements: {type: Info?, key: "Achievements"},
        character: {type: Info, key: "Character"},
        free_company: {type: Info?, key: "FreeCompany"},
        free_company_members: {type: Info?, key: "FreeCompanyMembers"},
        friends: {type: Info?, key: "Friends"},
        pvp_team: {type: Info?, key: "PvPTeam"}
      )
      # info about the achievements struct
      getter achievements
      # info about the character struct
      getter character
      # info about the free company struct
      getter free_company
      # info about the list of character summaries of all free company members
      getter free_company_members
      # info about the list of character summaries of all friends
      getter friends
      # info about the pvp team struct
      getter pvp_team
    end
  end
end
