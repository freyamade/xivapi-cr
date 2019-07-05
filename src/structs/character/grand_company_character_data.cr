require "json"
require "../utils/id_name_url"
require "../utils/id_icon_name_url"

module XIVAPI
  module Structs
    # Struct containing information about a Character's Grand Company.
    # Contains details about the Company itself as well as the Character's Rank within the Company.
    struct GrandCompanyCharacterData
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        company: {type: IDNameUrl, key: "Company"},
        rank: {type: IDIconNameUrl, key: "Rank"},
      )
      # An `IDNameUrl` struct containing information about the Grand Company.
      getter company
      # An `IDIconNameUrl` struct containing information about the Character's rank within the Grand Company.
      getter rank
    end
  end
end
