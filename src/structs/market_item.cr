require "json"

module XIVAPI
  module Structs
    # Struct for an item in the market
    struct MarketItem
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        history: {type: Array(Structs::History)?, key: "History"},
        id: {type: String?, key: "ID"},
        item: {type: Structs::Item?, key: "Item"},
        item_id: {type: UInt64?, key: "ItemID"},
        lodestone_id: {type: String?, key: "LodestoneID"},
        prices: {type: Array(MarketEntry)?, key: "Prices"},
        server: {type: UInt64?, key: "Server"},
        update_priority: {type: UInt64?, key: "UpdatePriority"},
        updated: {type: Time?, key: "Updated", converter: Time::EpochConverter},
      )
      # the sale history of the item
      getter history
      # the id of the item in the market
      getter id
      # the item in question
      getter item
      # the id of the item
      getter item_id
      # the id of the item in lodestone
      getter lodestone_id
      # the market entries of the item
      getter prices
      # the server id
      getter server
      # the update priority of this information
      getter update_priority
      # the time at which the info was last updated
      getter updated
    end
  end
end
