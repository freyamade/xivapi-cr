require "json"
require "../other/info"

module XIVAPI
  module Structs
    # Struct for info about the availability of different data
    struct CharacterInfo
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        achievements: {type: Structs::Info?, key: "Achievements"},
        character: {type: Structs::Info, key: "Character"},
        free_company: {type: Structs::Info?, key: "FreeCompany"},
        free_company_members: {type: Structs::Info?, key: "FreeCompanyMembers"},
        friends: {type: Structs::Info?, key: "Friends"},
        pvp_team: {type: Structs::Info?, key: "PvPTeam"}
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
