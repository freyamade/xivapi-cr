require "json"

module XIVAPI
  module Structs
    # Struct for any job or class
    struct Job
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        abbreviation: {type: String?, key: "Abbreviation"},
        class_job_category: {type: Structs::IDName?, key: "ClassJobCategory"},
        id: {type: Int32?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        name: {type: String?, key: "Name"},
        url: {type: String?, key: "Url"},
      )
      # abbreviation of the job
      getter abbreviation
      # the category of the job
      getter class_job_category
      # the id of the job
      getter id
      # url for the icon of the job
      getter url
      # the name of the job
      getter name
      # url for the job info
      getter url
    end
  end
end
