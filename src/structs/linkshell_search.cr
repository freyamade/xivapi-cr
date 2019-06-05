require "json"

module XIVAPI
  # A module of readonly structs that map API results back to Crystal data types
  module Structs
    # Struct for results from the `/search` endpoint
    struct LinkshellSearch
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        pagination: {type: Structs::Pagination, key: "Pagination"},
        results: {type: Array(Structs::Linkshell), key: "Results"},
      )
      # info about search pages
      getter pagination
      # an array of the results available
      getter results
    end
  end
end
