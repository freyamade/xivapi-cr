require "./client"

module XIVAPI
  class Client
    # In this file, add methods that are not in any other group.

    # A Set of Strings representing the allowed values for `indexes` for the Search endpoint.
    # These are not case sensitive as far as I am aware.
    SEARCH_INDEXES = Set{
      "achievement",
      "title",
      "action",
      "craftaction",
      "trait",
      "pvpaction",
      "pvptrait",
      "status",
      "bnpcname",
      "enpcresident",
      "companion",
      "mount",
      "leve",
      "emote",
      "instancecontent",
      "item",
      "recipe",
      "fate",
      "quest",
      "balloon",
      "buddyequip",
      "orchestrion",
      "placename",
      "weather",
      "world",
      "lore_finder",
    }

    # A Set of Strings representing the allowed values for `string_algo` for the Search endpoint.
    # The default is `wildcard`, and providing an invalid value to the search method will revert back to this value.
    SEARCH_ALGORITHMS = Set{
      "custom",
      "wildcard",
      "wildcard_plus",
      "fuzzy",
      "term",
      "prefix",
      "match",
      "match_phrase",
      "match_phrase_prefix",
      "multi_match",
    }

    # A Set of Strings representing the allowed values for `sort_order` for the Search endpoint.
    # The default is `asc`, and providing an invalid value to the search method will revert back to this value.
    SEARCH_SORT_ORDERS = Set{"asc", "desc"}

    # Private method that validates and prepares the HTTP GET parameters for the search and lore requests.
    private def prepare_search_parameters(
      string : String,
      string_algo : String,
      string_column : String,
      filters : Array(String),
      indexes : Array(String),
      sort_field : String,
      sort_order : String,
      page : Int32,
      limit : Int32
    ) : Hash(String, String)
      # First, we need to check the fields that we know have allowed values to ensure the supplied values are allowed.
      indexes = indexes.map { |field| field.downcase }
      indexes.reject! { |field| !SEARCH_INDEXES.includes? field }

      string_algo = string_algo.downcase
      if !SEARCH_ALGORITHMS.includes? string_algo
        string_algo = "wildcard"
      end

      sort_order = sort_order.downcase
      if !SEARCH_SORT_ORDERS.includes? sort_order
        sort_order = "asc"
      end

      if limit < 1 || limit > 100
        limit = 50
      end

      return {
        "string"        => string,
        "string_algo"   => string_algo,
        "string_column" => string_column,
        "filters"       => filters.join(","),
        "indexes"       => indexes.join(","),
        "sort_field"    => sort_field,
        "sort_order"    => sort_order,
        "page"          => page.to_s,
        "limit"         => limit.to_s,
      }
    end

    # Search the API for anything you need.
    def search(
      string : String = "",
      string_algo : String = "wildcard",
      string_column : String = "",
      filters : Array(String) = [] of String,
      indexes : Array(String) = [] of String,
      sort_field : String = "",
      sort_order : String = "asc",
      page : Int32 = 1,
      limit : Int32 = 50
    ) : Dataclasses::Page(Dataclasses::SearchResult)
      endpoint = "search"
      # First, prepare the query parameters
      params = prepare_search_parameters string, string_algo, string_column, filters, indexes, sort_field, sort_order, page, limit
      # Then simply send the request and return the response
      response = request endpoint, params
      begin
        return Dataclasses::Page(Dataclasses::SearchResult).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Search the API for Lore entries.
    def lore(
      string : String = "",
      string_algo : String = "wildcard",
      string_column : String = "",
      filters : Array(String) = [] of String,
      indexes : Array(String) = [] of String,
      sort_field : String = "",
      sort_order : String = "asc",
      page : Int32 = 1,
      limit : Int32 = 50,
      include_data : Bool = false
    ) : Dataclasses::Page(Dataclasses::Lore)
      endpoint = "lore"
      # First, prepare the query parameters
      params = prepare_search_parameters string, string_algo, string_column, filters, indexes, sort_field, sort_order, page, limit
      # Check if we need to also request the Data column
      if include_data
        # Request every normal column, and the Data column
        params["columns"] = "Context,Source,SourceID,Text,Data"
      end
      # Then simply send the request and return the response
      response = request endpoint, params
      begin
        return Dataclasses::Page(Dataclasses::Lore).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve an Array of all of the available content that is accessible in the API.
    def content : Array(String)
      endpoint = "content"
      response = request endpoint
      begin
        return Array(String).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve an Array of `Patch` structs, providing data on each game patch XIV has had.
    def patch_list : Array(Dataclasses::Patch)
      endpoint = "patchlist"
      response = request endpoint
      begin
        return Array(Dataclasses::Patch).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end
end
