require "json"
require "../other/info"

module XIVAPI
  module Dataclasses
    # Dataclass that contains the `Info` classs for the PvP Team request.
    class PvpInfo
      include JSON::Serializable
      # `Info` class containing the Info for the Linkshell data in the request.
      @[JSON::Field(key: "Linkshell")]
      getter linkshell : Info
      # `Info` class containing the Info for the PvP Team data in the request.
      # Nil when the PvP Team data is nil.
      @[JSON::Field(key: "PvPTeam")]
      getter pvp_team : Info?
    end
  end
end
