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

      # The ID of the item returned from the search results.
      getter id
      # The URL of the icon for the item.
      getter icon
      # The name of the item.
      getter name
      # The URL to the XIVAPI page for the item.
      getter url
      # The type of the URL, without the ID.
      getter url_type
      # The name of the type of data that this item is.
      getter datatype
      # The score of the item relative to the user's search query.
      getter score
    end
  end
end
