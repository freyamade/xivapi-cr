# ENDPOINT_MAP = {
#   "/lodestone/deepdungeon"  => Array(Structs::DeepDungeon),
#   "/lodestone/heavenonhigh" => Array(Structs::DeepDungeon),
#   "/lodestone/feasts"       => Array(Structs::Feast),
# }

require "./client"

module XIVAPI
  class Client
    # In this file, add methods for retrieving Lodestone data

    # Retrieve all of the current Lodestone information in a single request.
    # This endpoint is cached every 15 minutes in XIVAPI.
    # It is highly recommended to use this method as it contains the majority of the Lodestone data and returns instantly.
    def lodestone : Dataclasses::Lodestone
      # Fetch the latest Lodestone data.
      endpoint = "lodestone"
      response = request endpoint
      begin
        return Dataclasses::Lodestone.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get the latest information from the Lodestone homepage.
    def news : Array(Dataclasses::News)
      # Fetch the latest news.
      endpoint = "lodestone/news"
      response = request endpoint
      begin
        return Array(Dataclasses::News).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get the latest notices.
    def notices : Array(Dataclasses::Notice)
      # Fetch the latest notices.
      endpoint = "lodestone/notices"
      response = request endpoint
      begin
        return Array(Dataclasses::Notice).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get the latest maintenance posts.
    # Note that the posts in this endpoint do not contain specific details, like time.
    def maintenance : Array(Dataclasses::Status)
      # Fetch the latest maintenance posts.
      endpoint = "lodestone/maintenance"
      response = request endpoint
      begin
        return Array(Dataclasses::Status).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get a list of update posts.
    def updates : Array(Dataclasses::Notice)
      # Fetch the latest updates.
      endpoint = "lodestone/updates"
      response = request endpoint
      begin
        return Array(Dataclasses::Notice).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get a list of status posts.
    def status : Array(Dataclasses::Status)
      # Fetch the latest status.
      endpoint = "lodestone/status"
      response = request endpoint
      begin
        return Array(Dataclasses::Status).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get a list of topics.
    def topics : Array(Dataclasses::News)
      # Fetch the latest topics.
      endpoint = "lodestone/topics"
      response = request endpoint
      begin
        return Array(Dataclasses::News).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get the current status information for the FFXIV worlds.
    def world_status : Array(Dataclasses::WorldStatus)
      # Fetch the latest world status information.
      endpoint = "lodestone/worldstatus"
      response = request endpoint
      begin
        return Array(Dataclasses::WorldStatus).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get the latest Developer Blog information.
    def devblog : Array(Dataclasses::Devblog)
      # Fetch the latest developer blog information.
      endpoint = "lodestone/devblog"
      response = request endpoint
      begin
        return Array(Dataclasses::Devblog).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get the latest Dev posts from the official forums.
    def devposts : Array(Dataclasses::Devpost)
      # Fetch the latest developer blog information.
      endpoint = "lodestone/devposts"
      response = request endpoint
      begin
        return Array(Dataclasses::Devpost).from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get information about Palace of the Dead Leaderboards.
    #
    # `ranking_type` is either "solo" or "party".
    # Defaults to "party".
    # `job_name` is the acronym for a job to get rankings for, for "solo" type rankings.
    # Defaults to "pld".
    #
    # `datacenter` is the Datacenter to fetch results from.
    # Defaults to "Chaos" as that's the default for the Lodestone page.
    def palace_of_the_dead(ranking_type : String = "party", job_name : String = "pld", datacenter : String = "Chaos") : Dataclasses::DeepDungeonResponse
      endpoint = "lodestone/deepdungeon"
      params = {"solo_party" => ranking_type, "subtype" => job_name, "dcgroup" => datacenter}
      response = request endpoint
      begin
        return Dataclasses::DeepDungeonResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get information about Heaven on High Leaderboards.
    #
    # `ranking_type` is either "solo" or "party".
    # Defaults to "party".
    # `job_name` is the acronym for a job to get rankings for, for "solo" type rankings.
    # Defaults to "pld".
    #
    # `datacenter` is the Datacenter to fetch results from.
    # Defaults to "Chaos" as that's the default for the Lodestone page.
    def heaven_on_high(ranking_type : String = "party", job_name : String = "pld", datacenter : String = "Chaos") : Dataclasses::DeepDungeonResponse
      endpoint = "lodestone/heavenonhigh"
      params = {"solo_party" => ranking_type, "subtype" => job_name, "dcgroup" => datacenter}
      response = request endpoint
      begin
        return Dataclasses::DeepDungeonResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end

    # Get information about Feasts Ranking Leaderboards.
    # Response will be empty if there is currently no active season.
    #
    # `season` is the string value of the season number to get results for.
    # Defaults to the current season by sending an empty value.
    #
    # `rank_type` can be the string "all", or strings of numbers from "1" to "5" inclusive.
    # Defaults to "all".
    #
    # `datacenter` is the Datacenter to fetch results from.
    # Defaults to "Chaos" as that's the default for the Lodestone page.
    def feasts(season : String = "", rank_type : String = "all", datacenter : String = "Chaos") : Dataclasses::FeastResponse
      endpoint = "lodestone/feasts"
      params = {"season" => season, "rank_type" => rank_type, "dcgroup" => datacenter}
      response = request endpoint
      begin
        return Dataclasses::FeastResponse.from_json response
      rescue
        raise Exceptions::XIVAPIException.new(Dataclasses::Exception.from_json response)
      end
    end
  end
end
