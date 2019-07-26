require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for pagination data that is returned for paginated lists that come from certain API endpoints.
    class Pagination
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        page: {type: Int32, key: "Page"},
        next_page: {type: Int32?, key: "PageNext"},
        prev_page: {type: Int32?, key: "PagePrev"},
        total_pages: {type: Int32, key: "PageTotal"},
        results: {type: Int32, key: "Results"},
        results_per_page: {type: Int32, key: "ResultsPerPage"},
        total_results: {type: Int32, key: "ResultsTotal"},
      )

      # The number of the current page
      getter page
      # The number of the next page, or nil if there are none
      getter next_page
      # The number of the previous page, or nil if there are none
      getter prev_page
      # The total number of pages for the request
      getter total_pages
      # The number of results on the current page
      getter results
      # The limit of results per page
      getter results_per_page
      # The total number of results retrieved for the request
      getter total_results
    end
  end
end
