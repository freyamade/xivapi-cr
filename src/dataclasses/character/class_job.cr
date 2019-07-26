require "json"
require "./job"

module XIVAPI
  module Dataclasses
    # Dataclass for a job with experience
    class ClassJob
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        cls: {type: Job, key: "Class"},
        exp_level: {type: Int32, key: "ExpLevel"},
        exp_level_max: {type: Int32, key: "ExpLevelMax"},
        exp_level_togo: {type: Int32, key: "ExpLevelTogo"},
        is_specialised: {type: Bool, key: "IsSpecialised"},
        job: {type: Job, key: "Job"},
        level: {type: Int32, key: "Level"},
      )
      # A `Job` class containing the details about the Class for this Class / Job.
      getter cls
      # The current amount of experience points the Character has in this Class / Job.
      getter exp_level
      # The total amount of experience points required to level up.
      getter exp_level_max
      # The amount of experience points remaining for the Character to earn in order to level up.
      getter exp_level_togo
      # A flag stating whether or not the Class / Job is specialised.
      # This is a flag for DoH/DoL classes, in which you can specialise in up to 3 classes.
      getter is_specialised
      # A `Job` class containing the details about the Job for this Class / Job.
      getter job
      # The Character's current level in this Class / Job.
      getter level
    end
  end
end
