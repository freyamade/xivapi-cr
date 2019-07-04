require "json"

module XIVAPI
  module Structs
    # Struct for a gear in each character slot
    struct Gears
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        body: {type: Structs::EquippedGear?, key: "Body"},
        bracelets: {type: Structs::EquippedGear?, key: "Bracelets"},
        earrings: {type: Structs::EquippedGear?, key: "Earrings"},
        feet: {type: Structs::EquippedGear?, key: "Feet"},
        hands: {type: Structs::EquippedGear?, key: "Hands"},
        head: {type: Structs::EquippedGear?, key: "Head"},
        legs: {type: Structs::EquippedGear?, key: "Legs"},
        main_hand: {type: Structs::EquippedGear?, key: "MainHand"},
        necklace: {type: Structs::EquippedGear?, key: "Necklace"},
        off_hand: {type: Structs::EquippedGear?, key: "OffHand"},
        ring1: {type: Structs::EquippedGear?, key: "Ring1"},
        ring2: {type: Structs::EquippedGear?, key: "Ring2"},
        soul_crystal: {type: Structs::EquippedGear?, key: "SoulCrystal"},
        waist: {type: Structs::EquippedGear?, key: "Waist"},
      )
      # the body
      getter body
      # the bracelets
      getter bracelets
      # the earrings
      getter earrings
      # the feet
      getter feet
      # the hands
      getter hands
      # the head
      getter head
      # the legs
      getter legs
      # the main hand
      getter main_hand
      # the necklace
      getter necklace
      # the off hand
      getter off_hand
      # the ring1
      getter ring1
      # the ring2
      getter ring2
      # the soul crystal
      getter soul_crystal
      # the waist
      getter waist
    end
  end
end
