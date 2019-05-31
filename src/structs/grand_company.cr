require "json"

module XIVAPI
  module Structs
    # Struct for rank with a grand company
    struct GrandCompany
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        company: {type: Structs::IDNameUrl?, key: "Company"},
        rank: {type: Structs::IDIconNameUrl?, key: "Rank"},
      )
      # info about the grand company
      getter company
      # the rank with the grand company
      getter rank
    end
  end
end
