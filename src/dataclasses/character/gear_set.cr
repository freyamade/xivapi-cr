require "json"
require "./equipment"
require "./gear_set_attribute"
require "./job"

module XIVAPI
  module Dataclasses
    # Dataclass for a set of gears
    class GearSet
      # define a JSON mapping to create instances of this class
      include JSON::Serializable
      # An array of `GearSetAttribute` classs indicating the various attribute values for the GearSet.
      @[JSON::Field(key: "Attributes")]
      getter attributes : Array(GearSetAttribute)
      # A `Job` class indicating the Class for the GearSet
      @[JSON::Field(key: "Class")]
      getter cls : Job?
      # An `Equipment` class for the GearSet, indicating what piece of Gear is equipped in each slot on the Character.
      @[JSON::Field(key: "Gear")]
      getter gear : Equipment
      # A string in the form "#{class_id}_#{job_id}" that corresponds with the key for the ClassJob hash in the Character class.
      @[JSON::Field(key: "GearKey")]
      getter gear_key : String
      # A `Job` class indicating the Job for the GearSet.
      @[JSON::Field(key: "Job")]
      getter job : Job?
      # The level of the GearSet.
      # This is not IL, I'm unsure as to what it refers to.
      @[JSON::Field(key: "Level")]
      getter level : UInt64?
    end
  end
end
