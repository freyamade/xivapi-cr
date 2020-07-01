require "json"
require "../utils/id_name"

module XIVAPI
  module Dataclasses
    # Dataclass for details about a piece of Gear in FFXIV.
    # This is an abstract level class about the item itself, unrelated to any Character's owned copies of the item.
    class Gear
      # define a JSON mapping to create instances of this class
      include JSON::Serializable
      # An `IDName` class representing the class or job that is required for the Gear.
      @[JSON::Field(key: "ClassJobCategory")]
      getter class_job_category : IDName
      # The minimum level that is required to equip the Gear.
      @[JSON::Field(key: "LevelEquip")]
      getter equip_level : UInt64
      # The Lodestone ID of the Gear.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # A URL to the icon for the Gear.
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # The item level (IL) for the Gear.
      @[JSON::Field(key: "LevelItem")]
      getter item_level : UInt64
      # The name of the Gear.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The rarity value of the Gear
      @[JSON::Field(key: "Rarity")]
      getter rarity : UInt64
      # An `IDName` class representing the UI Category for the Gear.
      # The UI Category represents what type of Gear the item is, i.e. Body for a piece of body armour.
      @[JSON::Field(key: "ItemUICategory")]
      getter ui_category : IDName
    end
  end
end
