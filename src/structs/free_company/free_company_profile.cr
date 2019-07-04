require "json"

module XIVAPI
  module Structs
    # Struct containing profile information for a Free Company.
    struct FreeCompanyProfile
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        crest: {type: Array(String), key: "Crest"},
        id: {type: String, key: "ID"},
        name: {type: String, key: "Name"},
        server: {type: String, key: "Server"}
      )
      # An array of URLs to the images that make up the Free Company's crest
      getter crest
      # The Lodestone ID of the Free Company.
      getter id
      # The name of the Free Company.
      getter name
      # The main server on which the Free Company is situated.
      getter server
    end
  end
end
