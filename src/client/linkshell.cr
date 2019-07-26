require "./client"

module XIVAPI
  module Client::Linkshell
    # In this file, add methods for retrieving Linkshell data

    # Search the Lodestone API for Linkshells with a given name.
    # Optionally, search specific servers.
    def linkshell_search(name : String, server : String = "", page : UInt32 = 1) : Dataclasses::Page(Dataclasses::LinkshellSearch)
      # Send a request to the API for linkshell data, sending the passed parameters along with it
      endpoint = "linkshell/search"
      params = {
        "name"   => name,
        "server" => server,
        "page"   => page.to_s,
      }
      response = request endpoint, params
      begin
        return Dataclasses::Page(Dataclasses::LinkshellSearch).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve the details of the Linkshell with the given Lodestone ID.
    def linkshell(id : String) : Dataclasses::Linkshell
      endpoint = "linkshell/#{id}"
      response = request endpoint, {"data" => "LS"}
      begin
        return Dataclasses::Linkshell.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end

  # When this file is required, include the Linkshell module to have access to the commands
  class Client
    include Linkshell
  end
end
