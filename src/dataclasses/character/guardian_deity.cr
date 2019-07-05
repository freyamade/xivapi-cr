require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing information about a Character's Guardian Deity.
    class GuardianDeity
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        guardian_deity: {type: String?, key: "GuardianDeity", converter: String::RawConverter},
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
      )
      # This field always appears to be null so we're unsure what it is, but it will always come back as a String if it has a value.
      getter guardian_deity
      # The XIVAPI ID of the Guardian Deity
      getter id
      # A URL to the icon of the Guardian Deity.
      getter icon
      # The name of the Guardian Deity.
      getter name
      # A URL to the Guardian Deity's specific XIVAPI endpoint.
      getter url
    end
  end
end
