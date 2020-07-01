require "json"
require "../utils/id_icon_name_url"

module XIVAPI
  module Dataclasses
    # Dataclass for the Data column of the /lore endpoint data
    class LoreData
      include JSON::Serializable

      # ID of the item the piece of Lore is referring to.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # URL for the icon of the item.
      @[JSON::Field(key: "Icon")]
      getter icon : String?
      # The name of the item in the language requested by the client.
      @[JSON::Field(key: "Name")]
      getter name : String
      # URL to the XIVAPI page for the item in question.
      @[JSON::Field(key: "Url")]
      getter url : String
    end

    # Dataclass for items returned from the /lore/ endpoint
    class Lore
      include JSON::Serializable
      # A String identifying the context that the piece of text was found in.
      @[JSON::Field(key: "Context")]
      getter context : String
      # Extra data about the piece of Lore, tying it to another endpoint in the API.
      @[JSON::Field(key: "Data")]
      getter data : IDIconNameUrl?
      # The name of the source of the piece of Lore.
      @[JSON::Field(key: "Source")]
      getter source : String
      # The ID of the source.
      @[JSON::Field(key: "SourceID")]
      getter source_id : UInt64
      # The text of the Lore item.
      @[JSON::Field(key: "Text")]
      getter text : String
    end
  end
end
