require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct Ranking
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        monthly: {type: String?, key: "Monthly", converter: String::RawConverter},
        weekly: {type: String?, key: "Weekly", converter: String::RawConverter},
      )
      # the monthly ranking of the free company
      getter monthly
      # the weekly ranking of the free compant
      getter weekly
    end
  end
end
