require "json"
require "../other/info"

module XIVAPI
  module Dataclasses
    # Dataclass that contains the `Info` classs for the PvP Team request.
    class PvpInfo
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        linkshell: {type: Info, key: "Linkshell"},
        pvp_team: {type: Info?, key: "PvPTeam"},
      )
      # `Info` class containing the Info for the Linkshell data in the request.
      getter linkshell
      # `Info` class containing the Info for the PvP Team data in the request.
      # Nil when the PvP Team data is nil.
      getter pvp_team
    end
  end
end
