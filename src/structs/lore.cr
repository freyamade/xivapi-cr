require "json"

module XIVAPI
  module Structs
    # Struct for items returned from the /lore/ endpoint
    struct Lore
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        context: {type: String, key: "Context"},
        data: {type: LoreData?, key: "Data"},
        source: {type: String, key: "Source"},
        source_id: {type: Int32, key: "SourceID"},
        text: {type: String, key: "Text"},
      )
      # a string identifying the context that the piece of text was found in
      getter context
      # extra data about the piece of lore, tying it to another endpoint in the api
      getter data
      # the source of the piece of lore
      getter source
      # the id of the source of the piece of lore
      getter source_id
      # the text itself
      getter text
    end
  end
end
