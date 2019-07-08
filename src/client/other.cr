# ENDPOINT_MAP = {
#   "/search"    => Paginator(Structs::SearchResult),
#   "/lore"      => Paginator(Structs::Lore),
#   "/content"   => Array(String),
# }

require "json"
require "./client"

module XIVAPI
  class Client
    # In this file, add methods that are not in any other group.

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
