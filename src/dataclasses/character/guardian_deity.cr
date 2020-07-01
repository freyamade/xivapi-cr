require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing information about a Character's Guardian Deity.
    class GuardianDeity
      include JSON::Serializable
      # This field always appears to be null so we're unsure what it is, but it will always come back as a String if it has a value.
      @[JSON::Field(key: "GuardianDeity", converter: String::RawConverter)]
      getter guardian_deity : String?
      # The XIVAPI ID of the Guardian Deity
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # A URL to the icon of the Guardian Deity.
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # The name of the Guardian Deity.
      @[JSON::Field(key: "Name")]
      getter name : String
      # A URL to the Guardian Deity's specific XIVAPI endpoint.
      @[JSON::Field(key: "Url")]
      getter url : String
    end
  end
end
