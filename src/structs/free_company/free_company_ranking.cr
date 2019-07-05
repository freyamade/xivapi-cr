require "json"

module XIVAPI
  module Structs
    # A struct for the ranking data for a Free Company.
    struct FreeCompanyRanking
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        monthly: {type: String, key: "Monthly", converter: String::RawConverter},
        weekly: {type: String, key: "Weekly", converter: String::RawConverter},
      )
      # The rank for the month for the Free Company.
      getter monthly
      # The rank for the week for the Free Company.
      getter weekly
    end
  end
end
