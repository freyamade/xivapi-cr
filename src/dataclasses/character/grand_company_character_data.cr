require "json"
require "../utils/id_name_url"
require "../utils/id_icon_name_url"

module XIVAPI
  module Dataclasses
    # Dataclass containing information about a Character's Grand Company.
    # Contains details about the Company itself as well as the Character's Rank within the Company.
    class GrandCompanyCharacterData
      include JSON::Serializable
      # An `IDNameUrl` class containing information about the Grand Company.
      @[JSON::Field(key: "Company")]
      getter company : IDNameUrl
      # An `IDIconNameUrl` class containing information about the Character's rank within the Grand Company.
      @[JSON::Field(key: "Rank")]
      getter rank : IDIconNameUrl
    end
  end
end
