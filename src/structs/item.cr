require "json"

module XIVAPI
  module Structs
    # Struct for an item
    struct Item
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: Int32?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        item_level: {type: Int32?, key: "ItemLevel"},
        name: {type: String?, key: "Name"},
        name_de: {type: String?, key: "Name_de"},
        name_en: {type: String?, key: "Name_en"},
        name_fr: {type: String?, key: "Name_fr"},
        name_ja: {type: String?, key: "Name_ja"},
        rarity: {type: Int32?, key: "Rarity"},
      )
      # the ID of the item
      getter id
      # url to the icon for the item
      getter icon
      # the item level of the item
      getter item_level
      # the name of the item
      getter name
      # the german name of the item
      getter name_de
      # the english name of the item
      getter name_en
      # the french name of the item
      getter name_fr
      # the japenese name of the item
      getter name_ja
      # the rarity of the item
      getter rarity
    end
  end
end
