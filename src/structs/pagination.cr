require "json"

module XIVAPI
  module Structs
    # Struct for pagination data
    struct Pagination
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        page: {type: Int32, key: "Page"},
        next_page: {type: Int32?, key: "PageNext"},
        prev_page: {type: Int32?, key: "PagePrev"},
        total_pages: {type: Int32, key: "PageTotal"},
        results: {type: Int32, key: "Results"},
        results_per_page: {type: Int32, key: "ResultsPerPage"},
        total_results: {type: Int32, key: "ResultsTotal"},
      )

      # the number of the current page
      getter page
      # the number of the next page, or nil if there are none
      getter next_page
      # the number of the previous page, or nil if there are none
      getter prev_page
      # the total number of pages for the request
      getter total_pages
      # the number of results on the current page
      getter results
      # the limit of results per page
      getter results_per_page
      # the total number of results retrieved for the request
      getter total_results
    end
  end
end
