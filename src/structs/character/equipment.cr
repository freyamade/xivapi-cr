require "json"
require "./character_gear"

module XIVAPI
  module Structs
    # Struct that maps an `CharacterGear` struct to each possible equipment slot for a Character.
    struct Equipment
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        body: {type: CharacterGear?, key: "Body"},
        bracelets: {type: CharacterGear?, key: "Bracelets"},
        earrings: {type: CharacterGear?, key: "Earrings"},
        feet: {type: CharacterGear?, key: "Feet"},
        hands: {type: CharacterGear?, key: "Hands"},
        head: {type: CharacterGear?, key: "Head"},
        legs: {type: CharacterGear?, key: "Legs"},
        main_hand: {type: CharacterGear?, key: "MainHand"},
        necklace: {type: CharacterGear?, key: "Necklace"},
        off_hand: {type: CharacterGear?, key: "OffHand"},
        ring1: {type: CharacterGear?, key: "Ring1"},
        ring2: {type: CharacterGear?, key: "Ring2"},
        soul_crystal: {type: CharacterGear?, key: "SoulCrystal"},
        waist: {type: CharacterGear?, key: "Waist"},
      )
      # The `CharacterGear` that is currently equipped in the body slot.
      getter body
      # The `CharacterGear` that is currently equipped in the bracelets slot.
      getter bracelets
      # The `CharacterGear` that is currently equipped in the earrings slot.
      getter earrings
      # The `CharacterGear` that is currently equipped in the feet slot.
      getter feet
      # The `CharacterGear` that is currently equipped in the hands slot.
      getter hands
      # The `CharacterGear` that is currently equipped in the head slot.
      getter head
      # The `CharacterGear` that is currently equipped in the legs slot.
      getter legs
      # The `CharacterGear` that is currently equipped in the main hand slot.
      getter main_hand
      # The `CharacterGear` that is currently equipped in the necklace slot.
      getter necklace
      # The `CharacterGear` that is currently equipped in the off hand slot.
      getter off_hand
      # The `CharacterGear` that is currently equipped in the ring1 slot.
      getter ring1
      # The `CharacterGear` that is currently equipped in the ring2 slot.
      getter ring2
      # The `CharacterGear` that is currently equipped in the soul crystal slot.
      getter soul_crystal
      # The `CharacterGear` that is currently equipped in the waist slot.
      getter waist
    end
  end
end
