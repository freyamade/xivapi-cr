require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing profile information for a Free Company.
    class FreeCompanyProfile
      include JSON::Serializable
      # An array of URLs to the images that make up the Free Company's crest
      @[JSON::Field(key: "Crest")]
      getter crest : Array(String)
      # The Lodestone ID of the Free Company.
      @[JSON::Field(key: "ID")]
      getter id : String
      # The name of the Free Company.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The main server on which the Free Company is situated.
      @[JSON::Field(key: "Server")]
      getter server : String
    end
  end
end
