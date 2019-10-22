require "json"
require "./free_company"
require "../character/character_summary"

module XIVAPI
  module Dataclasses
    # A class used to map out the response from the Free Company endpoint.
    class FreeCompanyResponse
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        free_company: {type: FreeCompany, key: "FreeCompany"},
        free_company_members: {type: Array(CharacterSummary)?, key: "FreeCompanyMembers"},
      )
      # A `FreeCompany` class containing the information about the Free Company.
      getter free_company
      # An Array of `CharacterSummary` classs representing the Characters in the Free Company.
      # Will be `nil` unless the Free Company Members data (FCM) is requested, or if it is not yet in the system.
      getter free_company_members
    end
  end
end
