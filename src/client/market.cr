# ENDPOINT_MAP = {
#   "/market/{server}/item/{item_id}"   => Structs::MarketItem,
#   "/market/item/{item_id}?servers=[]" => Hash(String, Structs::MarketItem),
#   "/market/items?servers=[]&ids=[]"   => Array(Hash(String, Structs::MarketItem)),
#   "/market/ids"                       => Array(Int32),
#   "/market/categories"                => Array(Structs::Category), # Some kind of ItemSearchCategory struct? Might be also used elsewhere
# }
require "./client"

module XIVAPI
  class Client
    # In this file, add methods for retrieving Market data

    # Retrieve the details of a specific item on a specific server.
    # Specify a `limit` to limit the number of historic records returned for the item, defaults to 50.
    def market_server_item(server : String, item_id : UInt64, limit : Int32 = 50) : Dataclasses::MarketItem
      endpoint = "market/#{server}/item/#{item_id}"
      params = {"max_history" => limit.to_s}
      response = request endpoint, params
      begin
        return Dataclasses::MarketItem.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end
end
