require "json"

module XIVAPI
  module Structs
    # Struct for a sale history of an item on the market
    struct History
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        added: {type: Time?, key: "Added", converter: Time::EpochConverter},
        character_id: {type: String?, key: "CharacterID"},
        character_name: {type: String?, key: "CharacterName"},
        id: {type: String?, key: "ID"},
        is_hq: {type: Bool?, key: "IsHQ"},
        price_per_unit: {type: Int32?, key: "PricePerUnit"},
        price_total: {type: Int32?, key: "PriceTotal"},
        purchase_date: {type: Time?, key: "PurchaseDate", converter: Time::EpochConverter},
        purchase_date_ms: {type: String?, key: "PurchaseDateMS"},
        quantity: {type: Int32?, key: "Quantity"},
      )
      # the time when the item was added to the market board
      getter added
      # the id of the character who purchased the item
      getter character_id
      # the name of the character who purchased the item
      getter character_name
      # the id of the sale
      getter id
      # whether or not the item was hq
      getter is_hq
      # the price per item
      getter price_per_unit
      # the total price of the sale
      getter price_total
      # the purchase date of the sale
      getter purchase_date
      # the purchase date of the sale in ms
      getter purchase_date_ms
      # the quatity of items sold
      getter quantity
    end
  end
end
