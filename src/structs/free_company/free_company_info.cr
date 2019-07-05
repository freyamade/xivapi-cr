require "json"
require "../other/info"

module XIVAPI
  module Structs
    # Struct for containing information about the availability of requested data.
    struct FreeCompanyInfo
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        free_company: {type: Info, key: "FreeCompany"},
        free_company_members: {type: Info?, key: "FreeCompanyMembers"},
      )
      # An `Info` struct containing information about the requested Free Company.
      getter free_company
      # An `Info` struct containing information about the requested Free Company's Members.
      # Will be `nil` unless the Free Company Members data (FCM) is requested.
      getter free_company_members
    end
  end
end
