require "json"

module XIVAPI
  module Structs
    # Struct for an equipable item
    struct ArmourItem
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        class_job_category: {type: Structs::IDName?, key: "ClassJobCategory"},
        equip_level: {type: Int32?, key: "LevelEquip"},
        id: {type: UInt64?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        item_level: {type: Int32?, key: "LevelItem"},
        name: {type: String?, key: "Name"},
        rarity: {type: Int32?, key: "Rarity"},
        ui_category: {type: Structs::IDName?, key: "ItemUICategory"},
      )
      # the class job category for the piece of equipment
      getter class_job_category
      # the minimum level required to equip the item
      getter equip_level
      # the id of the item
      getter id
      # url of the in game icon for the piece of armour
      getter icon
      # the item level of the gear
      getter item_level
      # the name of the gear
      getter name
      # the rarity level of the gear
      getter rarity
      # the ui category for the item
      getter ui_category
    end
  end
end
