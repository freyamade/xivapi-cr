require "json"
require "./client"

module XIVAPI
  class Client
    # In this file, add methods for retrieving Servers data

    # Retrieve an Array of Servers (Worlds) for the game.
    def servers : Array(String)
      # Fetch an array of Servers.
      endpoint = "servers"
      response = request endpoint
      begin
        return Array(String).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Retrieve a Hash of Server information from the API, where the keys are Datacenters and the values are Arrays of Server names in each Datacenter.
    def datacenters : Hash(String, Array(String))
      endpoint = "servers/dc"
      response = request endpoint
      begin
        return Hash(String, Array(String)).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end
end
