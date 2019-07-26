require "json"
require "./item"
require "./item_history"
require "./market_entry"

module XIVAPI
  module Dataclasses
    # Dataclass representing an item on the Market Board.
    class MarketItem
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        history: {type: Array(ItemHistory), key: "History"},
        id: {type: String, key: "ID"},
        item: {type: Item, key: "Item"},
        item_id: {type: UInt64, key: "ItemID"},
        lodestone_id: {type: String, key: "LodestoneID"},
        prices: {type: Array(MarketEntry), key: "Prices"},
        server: {type: UInt64, key: "Server"},
        update_priority: {type: UInt64, key: "UpdatePriority"},
        updated: {type: Time, key: "Updated", converter: Time::EpochConverter},
      )
      # An Array of `ItemHistory` classs representing the old sale values of the Item.
      getter history
      # The ID of the MarketItem.
      # The ID string is in the format of "#{server_id}_#{item_id}".
      getter id
      # An `Item` class representing the item up for sale.
      getter item
      # The ID of the Item being sold.
      getter item_id
      # The ID of the Item on the Lodestone.
      getter lodestone_id
      # An Array of `MarketEntry` classs showing the current prices of the Item.
      getter prices
      # The ID of the server that the Item is being sold on.
      getter server
      # The value of the priority for updating the Item's Market details.
      getter update_priority
      # Timestamp for the previous time that the Market data was updated.
      getter updated
    end
  end
end
