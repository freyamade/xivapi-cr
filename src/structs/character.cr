require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Character
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        achievements: {type: Structs::Achievements?, key: "Achievements"},
        character: {type: Structs::CharacterData?, key: "Character"},
        free_company: {type: Structs::FreeCompany?, key: "FreeCompany"},
        free_company_members: {type: Array(Structs::CharacterSummary)?, key: "FreeCompanyMembers"},
        friends: {type: Array(Structs::CharacterSummary)?, key: "Friends"},
        info: {type: Structs::Info?, key: "Info"},
        pvp_team: {type: Structs::PvPTeam?, key: "PvPTeam"}
      )
      # the achievements struct
      getter achievements
      # the character struct
      getter character
      # the free company struct
      getter free_company
      # the list of character summaries of all free company members
      getter free_company_members
      # the list of character summaries of all friends
      getter friends
      # the info struct
      getter info
      # the pvp team struct
      getter pvp_team
    end
  end
end
