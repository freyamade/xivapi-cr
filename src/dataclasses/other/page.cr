require "json"
require "./pagination"

module XIVAPI
  module Dataclasses
    # A class that represents a page of results from paginated endpoints.
    # The Page class is a generic, so that we can use it for all kinds of endpoints.
    class Page(T)
      include JSON::Serializable

      # An `Pagination` class containing the pagination info for the request.
      @[JSON::Field(key: "Pagination")]
      getter pagination : Pagination
      # An Array of classs for the results from the API.
      # The Array will be of the classs of the generic type.
      @[JSON::Field(key: "Results")]
      getter results : Array(T)
    end
  end
end
