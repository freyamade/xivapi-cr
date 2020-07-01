require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for pagination data that is returned for paginated lists that come from certain API endpoints.
    class Pagination
      # define a JSON mapping to create instances of this class
      include JSON::Serializable

      # The number of the current page
      @[JSON::Field(key: "Page")]
      getter page : Int32
      # The number of the next page, or nil if there are none
      @[JSON::Field(key: "PageNext")]
      getter next_page : Int32?
      # The number of the previous page, or nil if there are none
      @[JSON::Field(key: "PagePrev")]
      getter prev_page : Int32?
      # The total number of pages for the request
      @[JSON::Field(key: "PageTotal")]
      getter total_pages : Int32
      # The number of results on the current page
      @[JSON::Field(key: "Results")]
      getter results : Int32
      # The limit of results per page
      @[JSON::Field(key: "ResultsPerPage")]
      getter results_per_page : Int32
      # The total number of results retrieved for the request
      @[JSON::Field(key: "ResultsTotal")]
      getter total_results : Int32
    end
  end
end
