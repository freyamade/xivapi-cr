require "json"
require "./free_company"
require "../character/character_summary"

module XIVAPI
  module Dataclasses
    # A class used to map out the response from the Free Company endpoint.
    class FreeCompanyResponse
      include JSON::Serializable
      # A `FreeCompany` class containing the information about the Free Company.
      @[JSON::Field(key: "FreeCompany")]
      getter free_company : FreeCompany
      # An Array of `CharacterSummary` classs representing the Characters in the Free Company.
      # Will be `nil` unless the Free Company Members data (FCM) is requested, or if it is not yet in the system.
      @[JSON::Field(key: "FreeCompanyMembers")]
      getter free_company_members : Array(CharacterSummary)?
    end
  end
end
