require "json"
require "../other/info"

module XIVAPI
  module Structs
    # Struct that contains the `Info` structs for the PvP Team request.
    struct PvPTeam
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        linkshell: {type: Info, key: "Linkshell"},
        pvp_team: {type: Info?, key: "PvPTeam"},
      )
      # `Info` struct containing the Info for the Linkshell data in the request.
      getter linkshell
      # `Info` struct containing the Info for the PvP Team data in the request.
      # Nil when the PvP Team data is nil.
      getter pvp_team
    end
  end
end
