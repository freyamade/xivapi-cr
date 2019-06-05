require "json"

module XIVAPI
  module Structs
    # Struct for a fc's profile
    struct FreeCompanyProfile
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        crest: {type: Array(String)?, key: "Crest"},
        id: {type: String?, key: "ID"},
        name: {type: String?, key: "Name"},
        server: {type: String?, key: "Server"}
      )
      # array or urls to images that make up the fc crest
      getter crest
      # the fc's id
      getter id
      # the name of the fc
      getter name
      # the name of the fc's server
      getter server
    end
  end
end
