require "json"

module XIVAPI
  module Structs
    # Struct for an Item
    struct Item
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        item_level: {type: UInt64, key: "LevelItem"},
        name: {type: String, key: "Name"},
        name_de: {type: String, key: "Name_de"},
        name_en: {type: String, key: "Name_en"},
        name_fr: {type: String, key: "Name_fr"},
        name_ja: {type: String, key: "Name_ja"},
        rarity: {type: UInt64, key: "Rarity"},
      )
      # The ID of the Item.
      getter id
      # URL to the icon for the Item.
      getter icon
      # The IL of the Item.
      getter item_level
      # The name of the Item.
      # Uses the language value requested by the API.
      getter name
      # The German name of the Item.
      getter name_de
      # The English name of the Item.
      getter name_en
      # The French name of the Item.
      getter name_fr
      # The Japanese name of the Item.
      getter name_ja
      # The rarity of the Item.
      getter rarity
    end
  end
end
