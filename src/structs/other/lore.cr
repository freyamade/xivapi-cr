require "json"

module XIVAPI
  module Structs
    # Struct for the Data column of the /lore endpoint data
    struct LoreData
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: UInt64, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        url: {type: String, key: "Url"},
      )

      # ID of the item the piece of Lore is referring to.
      getter id
      # URL for the icon of the item.
      getter icon
      # The name of the item in the language requested by the client.
      getter name
      # URL to the XIVAPI page for the item in question.
      getter url
    end

    # Struct for items returned from the /lore/ endpoint
    struct Lore
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        context: {type: String, key: "Context"},
        data: {type: LoreData?, key: "Data"},
        source: {type: String, key: "Source"},
        source_id: {type: UInt64, key: "SourceID"},
        text: {type: String, key: "Text"},
      )
      # A String identifying the context that the piece of text was found in.
      getter context
      # Extra data about the piece of Lore, tying it to another endpoint in the API.
      getter data
      # The name of the source of the piece of Lore.
      getter source
      # The ID of the source.
      getter source_id
      # The text of the Lore item.
      getter text
    end
  end
end
