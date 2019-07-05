require "json"
require "../utils/id_name"

module XIVAPI
  module Dataclasses
    # Dataclass containing data about a Class or Job
    class Job
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        abbreviation: {type: String, key: "Abbreviation"},
        class_job_category: {type: IDName?, key: "ClassJobCategory"},
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
      )
      # The abbreviated name of the Class or Job.
      getter abbreviation
      # An `IDName` class representing the category of the Class or Job.
      # Sometimes it is not sent, in which case the field will be nil.
      getter class_job_category
      # The XIVAPI ID of the Class or Job.
      getter id
      # URL to the icon for the Class or Job.
      getter url
      # The full name of the Class or Job.
      getter name
      # URL for the XIVAPI page for the Class or Job.
      getter url
    end
  end
end
