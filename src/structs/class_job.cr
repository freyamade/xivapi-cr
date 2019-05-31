require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct ClassJob
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        clas: {type: Structs::Job?, key: "Class"},
        exp_level: {type: Int32?, key: "ExpLevel"},
        exp_level_max: {type: Int32?, key: "ExpLevelMax"},
        exp_level_togo: {type: Int32?, key: "ExpLevelTogo"},
        is_specialised: {type: Bool?, key: "IsSpecialised"},
        job: {type: Structs::Job?, key: "Job"},
        level: {type: Int32?, key: "Level"},
      )
      # the class of the class job
      getter clas
      # the amount of exp in this level
      getter exp_level
      # the amount of exp needed to level up
      getter exp_level_max
      # the amount of remaining exp needed to level up
      getter exp_level_togo
      # if the job class is specialised or not
      getter is_specialised
      # the job of the job class
      getter job
      # the level of the job class
      getter level
    end
  end
end
