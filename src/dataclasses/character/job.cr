require "json"
require "../utils/id_name"

module XIVAPI
  module Dataclasses
    # Dataclass containing data about a Class or Job
    class Job
      include JSON::Serializable
      # The abbreviated name of the Class or Job.
      @[JSON::Field(key: "Abbreviation")]
      getter abbreviation : String
      # An `IDName` class representing the category of the Class or Job.
      # Sometimes it is not sent, in which case the field will be nil.
      @[JSON::Field(key: "ClassJobCategory")]
      getter class_job_category : IDName?
      # The XIVAPI ID of the Class or Job.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # URL to the icon for the Class or Job.
      @[JSON::Field(key: "Url")]
      getter url : String
      # The full name of the Class or Job.
      @[JSON::Field(key: "Name")]
      getter name : String
      # URL for the XIVAPI page for the Class or Job.
      @[JSON::Field(key: "Url")]
      getter url : String
    end
  end
end
