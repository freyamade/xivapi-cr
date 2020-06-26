require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for all character data classs
    class MinionMount
      include JSON::Serializable
      # The URL of the icon for the Minion or Mount.
      @[JSON::Field(key: "Icon")]
      getter icon : String
      # The name of the Minion or Mount.
      @[JSON::Field(key: "Name")]
      getter name : String
    end
  end
end
