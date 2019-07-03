require "json"

module XIVAPI
  # A module of readonly structs that map API results back to Crystal data types
  module Structs
    # Struct for results from the `/search` endpoint
    struct SearchResult
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
        url_type: {type: String, key: "UrlType"},
        datatype: {type: String, key: "_"},
        score: {type: UInt32, key: "_Score"},
      )

      # id of the piece of data
      getter id
      # the absolute path of the icon on the xivapi site
      getter icon
      # the name of the piece of data in the search result
      getter name
      # the absolute path for the piece of data on the xivapi site
      getter url
      # the type of url used for this piece of data
      getter url_type
      # the name of the type for this piece of data
      getter datatype
      # the score for this piece of data relative to the search query
      getter score
    end
  end
end
