require "json"
require "./job"

module XIVAPI
  module Dataclasses
    # Dataclass for a job with experience
    class ClassJob
      include JSON::Serializable
      # A `Job` class containing the details about the Class for this Class / Job.
      @[JSON::Field(key: "Class")]
      getter cls : Job
      # The current amount of experience points the Character has in this Class / Job.
      @[JSON::Field(key: "ExpLevel")]
      getter exp_level : Int32
      # The total amount of experience points required to level up.
      @[JSON::Field(key: "ExpLevelMax")]
      getter exp_level_max : Int32
      # The amount of experience points remaining for the Character to earn in order to level up.
      @[JSON::Field(key: "ExpLevelTogo")]
      getter exp_level_togo : Int32
      # A flag stating whether or not the Class / Job is specialised.
      # This is a flag for DoH/DoL classes, in which you can specialise in up to 3 classes.
      @[JSON::Field(key: "IsSpecialised")]
      getter is_specialised : Bool
      # A `Job` class containing the details about the Job for this Class / Job.
      @[JSON::Field(key: "Job")]
      getter job : Job
      # The Character's current level in this Class / Job.
      @[JSON::Field(key: "Level")]
      getter level : Int32
    end
  end
end
