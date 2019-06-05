require "json"

module XIVAPI
  module Structs
    # Struct for info about the availability of different data
    struct FreeCompanyInfo
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        free_company: {type: Structs::InfoData?, key: "FreeCompany"},
        free_company_members: {type: Structs::InfoData?, key: "FreeCompanyMembers"},
      )
      # info about the free company struct
      getter free_company
      # info about the list of character summaries of all free company members
      getter free_company_members
    end
  end
end
