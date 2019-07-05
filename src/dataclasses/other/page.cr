require "./pagination"

module XIVAPI
  module Dataclasses
    # A class that represents a page of results from paginated endpoints.
    # The Page class is a generic, so that we can use it for all kinds of endpoints.
    class Page(T)
      JSON.mapping(
        pagination: {type: Pagination, key: "Pagination"},
        results: {type: Array(T), key: "Results"},
      )

      # An `Pagination` class containing the pagination info for the request.
      getter pagination
      # An Array of classs for the results from the API.
      # The Array will be of the classs of the generic type.
      getter results
    end
  end
end
