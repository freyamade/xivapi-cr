require "json"

module XIVAPI
  module Structs
    # Struct for a piece of gear
    struct Gear
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        creator: {type: Int32?, key: "Creator"},
        dye: {type: Structs::IDIconName?, key: "Dye"},
        item: {type: Structs::ArmourItem?, key: "Item"},
        materia: {type: Array(Structs::IDIconNameUrl)?, key: "Materia"},
        mirage: {type: IDIconName?, key: "Mirage"},
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