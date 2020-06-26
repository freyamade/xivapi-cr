require "json"

module XIVAPI
  module Dataclasses
    # A class for the reputation data for a Free Company.
    class FreeCompanyReputation
      include JSON::Serializable
      # The name of the Grand Company the reputation value is for.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The progress value towards the next rank of reputation.
      @[JSON::Field(key: "Progress")]
      getter progress : UInt64
      # The current reputation rank with the Grand Company.
      getter reputation
    end
  end
end
