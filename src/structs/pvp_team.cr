require "json"

module XIVAPI
  module Structs
    # Struct for a pvp team
    struct PvPTeam
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        pagination: {type: Structs::Pagination?, key: "Pagination"},
        profile: {type: Structs::Profile?, key: "Profile"},
        results: {type: Array(Structs::Result)?, key: "Results"},
      )
      # info about the results pages
      getter pagination
      # the profile of the pvp team
      getter profile
      # the results from the pvp team matched
      getter results
    end
  end
end
