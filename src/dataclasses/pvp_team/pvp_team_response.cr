require "json"
require "./pvp_info"
require "./pvp_linkshell"
require "./pvp_team"

module XIVAPI
  module Dataclasses
    # Dataclass for the data that comes in a response from reading a specific PvP Team.
    class PvPTeam
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        info: {type: PvpInfo, key: "Info"},
        linkshell: {type: PvpLinkshell, key: "Linkshell"},
        pvp_team: {type: PvpTeam?, key: "PvPTeam"},
      )
      # A `PvpInfo` class for the information about the Linkshell and PvpTeam responses.
      getter info
      # A `PvpLinkshell` class representing the Linkshell information for the PvP Team.
      getter linkshell
      # A `PvpTeam` class that contains the data on the PvP Team.
      # Nil in most cases, cannot figure out how to get it to not be nil.
      getter pvp_team
    end
  end
end
