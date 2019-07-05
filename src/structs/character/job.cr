require "json"
require "../utils/id_name"

module XIVAPI
  module Structs
    # Struct containing data about a Class or Job
    struct Job
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        abbreviation: {type: String, key: "Abbreviation"},
        class_job_category: {type: IDName, key: "ClassJobCategory"},
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
      )
      # The abbreviated name of the Class or Job.
      getter abbreviation
      # The category of the Class or Job.
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
