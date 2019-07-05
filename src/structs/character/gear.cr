require "json"
require "../utils/id_name"

module XIVAPI
  module Structs
    # Struct for details about a piece of Gear in FFXIV.
    # This is an abstract level struct about the item itself, unrelated to any Character's owned copies of the item.
    struct Gear
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        class_job_category: {type: IDName, key: "ClassJobCategory"},
        equip_level: {type: UInt64, key: "LevelEquip"},
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        item_level: {type: UInt64, key: "LevelItem"},
        name: {type: String, key: "Name"},
        rarity: {type: UInt64, key: "Rarity"},
        ui_category: {type: IDName, key: "ItemUICategory"},
      )
      # An `IDName` struct representing the class or job that is required for the Gear.
      getter class_job_category
      # The minimum level that is required to equip the Gear.
      getter equip_level
      # The Lodestone ID of the Gear.
      getter id
      # A URL to the icon for the Gear.
      getter icon
      # The item level (IL) for the Gear.
      getter item_level
      # The name of the Gear.
      getter name
      # The rarity value of the Gear
      getter rarity
      # An `IDName` struct representing the UI Category for the Gear.
      # The UI Category represents what type of Gear the item is, i.e. Body for a piece of body armour.
      getter ui_category
    end
  end
end
