require "./pagination"

module XIVAPI
  module Structs
    # A struct that represents a page of results from paginated endpoints.
    # The Page struct is a generic, so that we can use it for all kinds of endpoints.
    struct Page(T)
      JSON.mapping(
        pagination: {type: Structs::Pagination, key: "Pagination"},
        results: {type: Array(T), key: "Results"},
      )

      # An `XIVAPI::Structs::Pagination` struct containing the pagination info for the request
      getter pagination
      # The results contained in the page
      getter results
    end
  end
end
