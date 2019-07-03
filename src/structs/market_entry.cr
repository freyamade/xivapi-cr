require "json"

module XIVAPI
  module Structs
    # Struct for a current entry in the market board
    struct MarketEntry
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        added: {type: Time?, key: "Added", converter: Time::EpochConverter},
        creator_signature_id: {type: String?, key: "CreatorSignatureID"},
        creator_signature: {type: String?, key: "CreatorSignatureName"},
        id: {type: String?, key: "ID"},
        is_crafted: {type: Bool?, key: "IsCrafted"},
        is_hq: {type: Bool?, key: "IsHQ"},
        materia: {type: Array(Structs::IDIconNameUrl)?, key: "Materia"},
        price_per_unit: {type: UInt64?, key: "PricePerUnit"},
        price_total: {type: UInt64?, key: "PriceTotal"},
        quantity: {type: UInt64?, key: "Quantity"},
        retainer_id: {type: String?, key: "RetainerID"},
        retainer_name: {type: String?, key: "RetainerName"},
        stain_id: {type: UInt64?, key: "StainID"},
        town_id: {type: UInt64?, key: "TownID"},
      )
      # the ID
      getter id
      # the Icon
      getter icon
      # the small Icon
      getter icon_small
      # the Name
      getter name
      # the Url
      getter url
    end
  end
end
