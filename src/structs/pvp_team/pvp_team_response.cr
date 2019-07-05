require "json"
require "./pvp_linkshell"
require "./pvp_team"
require "./pvp_team_info"

module XIVAPI
  module Structs
    # Struct for the data that comes in a response from reading a specific PvP Team.
    struct PvPTeam
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        info: {type: PvpInfo, key: "Info"},
        linkshell: {type: PvpLinkshell, key: "Linkshell"},
        pvp_team: {type: PvpTeam?, key: "PvPTeam"},
      )
      # A `PvpInfo` struct for the information about the Linkshell and PvpTeam responses.
      getter info
      # A `PvpLinkshell` struct representing the Linkshell information for the PvP Team.
      getter linkshell
      # A `PvpTeam` struct that contains the data on the PvP Team.
      # Nil in most cases, cannot figure out how to get it to not be nil.
      getter pvp_team
    end
  end
end
