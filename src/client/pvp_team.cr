require "./client"

module XIVAPI
  module Client::PvpTeam
    # In this file, add methods for retrieving PvpTeam data

    # Search the Lodestone API for PvP Teams with a given name.
    # Optionally, search specific servers.
    # NOTE: This method isn't fully tested, since any requests we made to the endpoint returned no results.
    def pvp_team_search(name : String, server : String = "", page : UInt32 = 1) : Dataclasses::Page(Dataclasses::PvpTeamProfile)
      # Send a request to the API for pvp team data, sending the passed parameters along with it
      endpoint = "pvpteam/search"
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request endpoint, params
      begin
        return Dataclasses::Page(Dataclasses::PvpTeamProfile).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve the details of the PvpTeam with the given Lodestone ID.
    def pvp_team(id : String) : Dataclasses::PvpTeamResponse
      endpoint = "pvpteam/#{id}"
      response = request endpoint, {"data" => "PVP"}
      begin
        return Dataclasses::PvpTeamResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end

  # When this file is required, include the PvpTeam module to have access to the commands
  class Client
    include PvpTeam
  end
end
