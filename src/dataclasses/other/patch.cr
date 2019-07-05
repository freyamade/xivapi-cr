require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for individual entries in the patch list
    class Patch
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        banner: {type: String, key: "Banner"},
        ex_version: {type: UInt64, key: "ExVersion"},
        id: {type: UInt64, key: "ID"},
        name: {type: String, key: "Name"},
        release_date: {type: Time, key: "ReleaseDate", converter: Time::EpochConverter},
        version: {type: String, key: "Version"}
      )
      # URL to the image used for the banner of the patch notes.
      getter banner
      # The ID to the file.
      getter ex_version
      # The internal XIVAPI ID for the patch.
      getter id
      # The name of the patch in the requested language.
      getter name
      # Timestamp for the relase date of the patch.
      getter release_date
      # The version code as a string.
      getter version
    end
  end
end
