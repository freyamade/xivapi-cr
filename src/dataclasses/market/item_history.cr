require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for a sale history of an Item on the market
    class ItemHistory
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        added: {type: Time, key: "Added", converter: Time::EpochConverter},
        character_id: {type: String?, key: "CharacterID"},
        character_name: {type: String, key: "CharacterName"},
        id: {type: String, key: "ID"},
        is_hq: {type: Bool, key: "IsHQ"},
        price_per_unit: {type: UInt64, key: "PricePerUnit"},
        price_total: {type: UInt64, key: "PriceTotal"},
        purchase_date: {type: Time, key: "PurchaseDate", converter: Time::EpochConverter},
        purchase_date_ms: {type: String, key: "PurchaseDateMS"},
        quantity: {type: UInt64, key: "Quantity"},
      )
      # Timestamp for when the item was put up onto the Market Board
      getter added
      # The Lodestone ID of the Character that purchased the item.
      getter character_id
      # The name of the Character that purchased the item.
      getter character_name
      # The ID of the history record.
      getter id
      # Flag stating whether or not the item sold was High Quality (HQ)
      getter is_hq
      # The price per unit for the items in the sale.
      getter price_per_unit
      # The total price of the sale.
      getter price_total
      # Timestamp of the time of purchase.
      getter purchase_date
      # The date of purchase in ms (?)
      getter purchase_date_ms
      # The total number of items sold in the sale.
      getter quantity
    end
  end
end
