require "json"

module XIVAPI
  module Structs
    # Struct for an equipable item
    struct ArmourItem
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        class_job_category: {type: Structs::IDName?, key: "ClassJobCategory"},
        id: {type: UInt64?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        item_ui_category: {type: Structs::IDName?, key: "ItemUICategory"},
        level_equip: {type: Int32?, key: "LevelEquip"},
        level_item: {type: Int32?, key: "LevelItem"},
        name: {type: String?, key: "Name"},
        rarity: {type: Int32?, key: "Rarity"},
      )
      # the creator of the gear
      getter creator
      # the dye on the gear
      getter dye
      # the item being worn as gear
      getter item
      # the materia on the gear
      getter materia
      # the mirage on the gear
      getter mirage
    end
  end
end
