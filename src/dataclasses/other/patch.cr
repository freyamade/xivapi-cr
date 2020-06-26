require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for individual entries in the patch list
    class Patch
      include JSON::Serializable
      # URL to the image used for the banner of the patch notes.
      @[JSON::Field(key: "Banner")]
      getter banner : String?
      # The ID to the file.
      @[JSON::Field(key: "ExVersion")]
      getter ex_version : UInt64
      # The internal XIVAPI ID for the patch.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # The name of the patch in the requested language.
      @[JSON::Field(key: "Name")]
      getter name : String
      # Timestamp for the relase date of the patch.
      @[JSON::Field(key: "ReleaseDate", converter: Time::EpochConverter)]
      getter release_date : Time
      # The version code as a string.
      @[JSON::Field(key: "Version")]
      getter version : String
    end
  end
end
