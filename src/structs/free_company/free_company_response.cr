require "json"
require "./free_company"
require "./free_company_info"
require "../character/character_summary"

module XIVAPI
  module Structs
    # A struct used to map out the response from the Free Company endpoint.
    struct FreeCompanyResponse
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        free_company: {type: Structs::FreeCompany, key: "FreeCompany"},
        free_company_members: {type: Array(Structs::CharacterSummary)?, key: "FreeCompanyMembers"},
        info: {type: Structs::FreeCompanyInfo, key: "Info"},
      )
      # A `FreeCompany` struct containing the information about the Free Company.
      getter free_company
      # An Array of `CharacterSummary` structs representing the Characters in the Free Company.
      # Will be `nil` unless the Free Company Members data (FCM) is requested, or if it is not yet in the system.
      getter free_company_members
      # A `FreeCompanyInfo` struct containing information about the status of the items requested.
      getter info
    end
  end
end
