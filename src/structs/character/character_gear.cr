require "json"
require "./gear"
require "../utils/id_icon_name"
require "../utils/id_icon_name_url"

module XIVAPI
  module Structs
    # Struct for a piece of Gear owned by a Character.
    # This struct wraps the `Gear` struct and adds extra, instanced details like dye, glamour and materia, as each character will have different copies of the same piece of `Gear`.
    struct CharacterGear
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        creator: {type: UInt64?, key: "Creator"},
        dye: {type: IDIconName?, key: "Dye"},
        glamour: {type: IDIconName?, key: "Mirage"},
        item: {type: Gear, key: "Item"},
        materia: {type: Array(IDIconNameUrl), key: "Materia"},
      )
      # The ID of the Character that made the piece of equipment in question.
      getter creator
      # An `IDIconName` struct containing details about the dye currently on the Gear.
      getter dye
      # An `IDIconName` struct containing information about the piece of Gear currently being used as a glamour for this piece of Gear.
      getter glamour
      # A `GearItem` struct that contains the details about the item that is equipped.
      getter item
      # An Array of `IDIconName` structs that corresponds to the list of Materia currently melded to the Equipped Gear.
      getter materia
    end
  end
end
