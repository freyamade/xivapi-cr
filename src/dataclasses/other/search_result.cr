require "json"

module XIVAPI
  # A module of readonly classs that map API results back to Crystal data types
  module Dataclasses
    # Dataclass for results from the `/search` endpoint
    class SearchResult
      include JSON::Serializable

      # The ID of the item returned from the search results.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # The URL of the icon for the item.
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # The name of the item.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The URL to the XIVAPI page for the item.
      @[JSON::Field(key: "Url")]
      getter url : String
      # The type of the URL, without the ID.
      @[JSON::Field(key: "UrlType")]
      getter url_type : String
      # The name of the type of data that this item is.
      @[JSON::Field(key: "_")]
      getter datatype : String
      # The score of the item relative to the user's search query.
      @[JSON::Field(key: "_Score", converter: String::RawConverter)]
      getter score : String
    end
  end
end
