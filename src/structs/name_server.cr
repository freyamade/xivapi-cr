require "json"

module XIVAPI
  module Structs
    # Struct for a character search
    struct NameServer
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        pagination: {type: Structs::Pagination?, key: "Pagination"},
        results: {type: Array(Structs::CharacterSummary)?, key: "Results"},
      )
      # the page info
      getter pagination
      # an array of the results
      getter results
    end
  end
end
