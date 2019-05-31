require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Gears
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        creator: {type: Int32?, key: "Creator"},
        dye: {type: Structs::IDIconName?, key: "Dye"},
        item: {type: Structs::Item?, key: "Item"},
        materia: {type: Array, key: "Feet"},
        hands: {type: Structs::Gear, key: "Hands"},
        head: {type: Structs::Gear, key: "Head"},
        legs: {type: Structs::Gear, key: "Legs"},
        main_hand: {type: Structs::Gear, key: "MainHand"},
        necklace: {type: Structs::Gear, key: "Necklace"},
        off_hand: {type: Structs::Gear, key: "OffHand"},
        ring1: {type: Structs::Gear, key: "Ring1"},
        ring2: {type: Structs::Gear, key: "Ring2"},
        waist: {type: Structs::Gear, key: "Waist"},
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
      # the waist
      getter waist
    end
  end
end