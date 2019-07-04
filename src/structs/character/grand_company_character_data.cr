require "json"

module XIVAPI
  module Structs
    # Struct containing information about a Character's Grand Company.
    # Contains details about the Company itself as well as the Character's Rank within the Company.
    struct GrandCompanyCharacterData
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        company: {type: Structs::IDNameUrl, key: "Company"},
        rank: {type: Structs::IDIconNameUrl, key: "Rank"},
      )
      # An `IDNameUrl` struct containing information about the Grand Company.
      getter company
      # An `IDIconNameUrl` struct containing information about the Character's rank within the Grand Company.
      getter rank
    end
  end
end
