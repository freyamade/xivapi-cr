require "json"
require "../utils/id_icon_name_url"

module XIVAPI
  module Dataclasses
    # Dataclass for a current entry on the Market Board.
    class MarketEntry
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        added: {type: Time, key: "Added", converter: Time::EpochConverter},
        creator_signature_id: {type: String?, key: "CreatorSignatureID"},
        creator_signature: {type: String, key: "CreatorSignatureName"},
        id: {type: String, key: "ID"},
        is_crafted: {type: Bool, key: "IsCrafted"},
        is_hq: {type: Bool, key: "IsHQ"},
        materia: {type: Array(IDIconNameUrl), key: "Materia"},
        price_per_unit: {type: UInt64, key: "PricePerUnit"},
        price_total: {type: UInt64, key: "PriceTotal"},
        quantity: {type: UInt64, key: "Quantity"},
        retainer_id: {type: String?, key: "RetainerID"},
        retainer_name: {type: String, key: "RetainerName"},
        stain_id: {type: UInt64, key: "StainID"},
        town_id: {type: UInt64, key: "TownID"},
      )
      # Timestamp for the date and time when the Market Item was added to the Market Board.
      getter added
      # The ID of the Character that created the Market Entry.
      getter creator_signature_id
      # The name of the Character that created the Market Entry.
      getter creator_signature
      # The ID of the Market Entry item.
      getter id
      # A flag stating whether or not the item being sold is crafted.
      getter is_crafted
      # A flag stating whether or not the item being sold is high quality.
      getter is_hq
      # An Array of `IDIconNameUrl` classs that represent the Materia attached to the item being sold.
      getter materia
      # The price per unit for each item in the sale.
      getter price_per_unit
      # The total price for the sale.
      getter price_total
      # The number of items being sold.
      getter quantity
      # The ID of the Retainer selling the item.
      getter retainer_id
      # The name of the Retainer selling the item.
      getter retainer_name
      # ID of the stain on the Item?
      # I'm really unsure what this is to be totally honest.
      getter stain_id
      # ID of the town the item is being sold from.
      getter town_id
    end
  end
end
