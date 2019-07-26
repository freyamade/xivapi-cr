require "./client"

module XIVAPI
  class Client
    # In this file, add methods for retrieving Market data

    # Retrieve the details of a specific item on a specific server.
    # Specify a `max_history` to limit the number of historic records returned for the item, defaults to 50.
    def market(item_id : UInt64, server : String, max_history : Int32 = 50) : Dataclasses::MarketItem
      endpoint = "market/#{server}/item/#{item_id}"
      params = {"max_history" => max_history.to_s}
      response = request endpoint, params
      begin
        return Dataclasses::MarketItem.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve the details of a specific item on multiple servers.
    # Specify a `max_history` to limit the number of historic records returned for the item, defaults to 50.
    # If datacenter is specified, it takes priority over the servers array, and will return data for all of the servers in the chosen datacenter.
    #
    # The response from this method is a Hash of server name to the item's details.
    def market(item_id : UInt64, servers : Array(String) = [] of String, datacenter : String = "", max_history : Int32 = 50) : Hash(String, Dataclasses::MarketItem)
      endpoint = "market/item/#{item_id}"
      params = {
        "max_history" => max_history.to_s,
        "servers"     => servers.join(","),
        "dc"          => datacenter,
      }
      response = request endpoint, params
      begin
        return Hash(String, Dataclasses::MarketItem).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve the details of an array of items on multiple servers.
    # Specify a `max_history` to limit the number of historic records returned for the item, defaults to 50.
    # If datacenter is specified, it takes priority over the servers array, and will return data for all of the servers in the chosen datacenter.
    #
    # The response from this method is an Array of Hashes from server names to item details.
    # The items in the array match the items in the array of item ids.
    def market(item_ids : Array(UInt64), servers : Array(String) = [] of String, datacenter : String = "", max_history : Int32 = 50) : Array(Hash(String, Dataclasses::MarketItem))
      endpoint = "market/items"
      params = {
        "max_history" => max_history.to_s,
        "servers"     => servers.join(","),
        "dc"          => datacenter,
        "ids"         => item_ids.join(","),
      }
      response = request endpoint, params
      begin
        return Array(Hash(String, Dataclasses::MarketItem)).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve a list of item ids that are sellable on the Market Board.
    def sellable_item_ids : Array(UInt64)
      endpoint = "market/ids"
      response = request endpoint
      begin
        return Array(UInt64).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve a list of item categories that can be used for searching on the Market Board.
    def market_search_categories : Array(Dataclasses::MarketCategory)
      endpoint = "market/categories"
      response = request endpoint
      begin
        return Array(Dataclasses::MarketCategory).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end
end
