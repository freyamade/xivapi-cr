require "json"

module XIVAPI
  module Structs
    # Struct for a free company
    struct FC
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        free_company: {type: Structs::FreeCompany?, key: "FreeCompany"},
        free_company_members: {type: Array(Structs::CharacterSummary)?, key: "FreeCompanyMembers"},
        info: {type: Structs::FreeCompanyInfo?, key: "Info"},
      )
      # info about the free company
      getter free_company
      # info about the fc's members
      getter free_company_members
      # info about the availability of data
      getter info
    end
  end
end
