require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct ClassJob
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        attributes: {type: Array(Structs::Attribute)?, key: "Attributes"},
        clas: {type: Structs::Job?, key: "Class"},
        gear: {type: Structs::Gears?, key: "Gear"},
        gear_key: {type: String?, key: "GearKey"},
        job: {type: Structs::Job?, key: "Job"},
        level: {type: Int32?, key: "Level"},
      )
      # the attributes of the gear set
      getter attributes
      # the class of the gear set
      getter clas
      # the pieces of gear in the gear set
      getter gear
      # the key of the gear set
      getter gear_key
      # the job of the gear set
      getter job
      # the item level of the gear set
      getter level
    end
  end
end
