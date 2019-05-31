require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Ranking
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        monthly: {type: String?, key: "Monthly"},
        weekly: {type: String?, key: "Weekly"},
      )
      # the monthly ranking of the free company
      getter monthly
      # the weekly ranking of the free compant
      getter weekly
    end
  end
end
