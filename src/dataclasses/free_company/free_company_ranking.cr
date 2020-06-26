require "json"

module XIVAPI
  module Dataclasses
    # A class for the ranking data for a Free Company.
    class FreeCompanyRanking
      include JSON::Serializable
      # The rank for the month for the Free Company.
      @[JSON::Field(key: "Monthly", converter: String::RawConverter)]
      getter monthly : String
      # The rank for the week for the Free Company.
      @[JSON::Field(key: "Weekly", converter: String::RawConverter)]
      getter weekly : String
    end
  end
end
