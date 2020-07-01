require "json"
require "./pvp_info"
require "./pvp_linkshell"
require "./pvp_team"

module XIVAPI
  module Dataclasses
    # Dataclass for the data that comes in a response from reading a specific PvP Team.
    class PvpTeamResponse
      include JSON::Serializable
      # A `PvpInfo` class for the information about the Linkshell and PvpTeam responses.
      @[JSON::Field(key: "Info")]
      getter info : PvpInfo
      # A `PvpLinkshell` class representing the Linkshell information for the PvP Team.
      @[JSON::Field(key: "Linkshell")]
      getter linkshell : PvpLinkshell
      # A `PvpTeam` class that contains the data on the PvP Team.
      # Nil in most cases, cannot figure out how to get it to not be nil.
      @[JSON::Field(key: "PvPTeam")]
      getter pvp_team : PvpTeam?
    end
  end
end
