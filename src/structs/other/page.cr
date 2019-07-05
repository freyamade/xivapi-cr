require "./pagination"

module XIVAPI
  module Structs
    # A struct that represents a page of results from paginated endpoints.
    # The Page struct is a generic, so that we can use it for all kinds of endpoints.
    struct Page(T)
      JSON.mapping(
        pagination: {type: Pagination, key: "Pagination"},
        results: {type: Array(T), key: "Results"},
      )

      # An `Pagination` struct containing the pagination info for the request.
      getter pagination
      # An Array of structs for the results from the API.
      # The Array will be of the structs of the generic type.
      getter results
    end
  end
end
