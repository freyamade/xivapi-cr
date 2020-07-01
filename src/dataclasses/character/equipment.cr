require "json"
require "./character_gear"

module XIVAPI
  module Dataclasses
    # Dataclass that maps an `CharacterGear` class to each possible equipment slot for a Character.
    class Equipment
      # define a JSON mapping to create instances of this class
      include JSON::Serializable
      # The `CharacterGear` that is currently equipped in the body slot.
      @[JSON::Field(key: "Body")]
      getter body : CharacterGear?
      # The `CharacterGear` that is currently equipped in the bracelets slot.
      @[JSON::Field(key: "Bracelets")]
      getter bracelets : CharacterGear?
      # The `CharacterGear` that is currently equipped in the earrings slot.
      @[JSON::Field(key: "Earrings")]
      getter earrings : CharacterGear?
      # The `CharacterGear` that is currently equipped in the feet slot.
      @[JSON::Field(key: "Feet")]
      getter feet : CharacterGear?
      # The `CharacterGear` that is currently equipped in the hands slot.
      @[JSON::Field(key: "Hands")]
      getter hands : CharacterGear?
      # The `CharacterGear` that is currently equipped in the head slot.
      @[JSON::Field(key: "Head")]
      getter head : CharacterGear?
      # The `CharacterGear` that is currently equipped in the legs slot.
      @[JSON::Field(key: "Legs")]
      getter legs : CharacterGear?
      # The `CharacterGear` that is currently equipped in the main hand slot.
      @[JSON::Field(key: "MainHand")]
      getter main_hand : CharacterGear?
      # The `CharacterGear` that is currently equipped in the necklace slot.
      @[JSON::Field(key: "Necklace")]
      getter necklace : CharacterGear?
      # The `CharacterGear` that is currently equipped in the off hand slot.
      @[JSON::Field(key: "OffHand")]
      getter off_hand : CharacterGear?
      # The `CharacterGear` that is currently equipped in the ring1 slot.
      @[JSON::Field(key: "Ring1")]
      getter ring1 : CharacterGear?
      # The `CharacterGear` that is currently equipped in the ring2 slot.
      @[JSON::Field(key: "Ring2")]
      getter ring2 : CharacterGear?
      # The `CharacterGear` that is currently equipped in the soul crystal slot.
      @[JSON::Field(key: "SoulCrystal")]
      getter soul_crystal : CharacterGear?
      # The `CharacterGear` that is currently equipped in the waist slot.
      @[JSON::Field(key: "Waist")]
      getter waist : CharacterGear?
    end
  end
end
