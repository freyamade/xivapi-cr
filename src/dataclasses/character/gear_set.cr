require "json"
require "./equipment"
require "./gear_set_attribute"
require "./job"

module XIVAPI
  module Dataclasses
    # Dataclass for a set of gears
    class GearSet
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        attributes: {type: Array(GearSetAttribute), key: "Attributes"},
        cls: {type: Job, key: "Class"},
        gear: {type: Equipment, key: "Gear"},
        gear_key: {type: String, key: "GearKey"},
        job: {type: Job, key: "Job"},
        level: {type: UInt64, key: "Level"},
      )
      # An array of `GearSetAttribute` classs indicating the various attribute values for the GearSet.
      getter attributes
      # A `Job` class indicating the Class for the GearSet
      getter cls
      # An `Equipment` class for the GearSet, indicating what piece of Gear is equipped in each slot on the Character.
      getter gear
      # A string in the form "#{class_id}_#{job_id}" that corresponds with the key for the ClassJob hash in the Character class.
      getter gear_key
      # A `Job` class indicating the Job for the GearSet.
      getter job
      # The level of the GearSet.
      # This is not IL, I'm unsure as to what it refers to.
      getter level
    end
  end
end