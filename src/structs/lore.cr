require "json"

module XIVAPI
  module Structs
    # Struct for the Data column of the /lore/ endpoint data
    struct LoreData
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        id: {type: Int32, key: "ID"},
        icon: {type: String, key: "Icon"},
        name: {type: String, key: "Name"},
        name_cn: {type: String?, key: "Name_cn"},
        name_de: {type: String?, key: "Name_de"},
        name_en: {type: String?, key: "Name_en"},
        name_fr: {type: String?, key: "Name_fr"},
        name_ja: {type: String?, key: "Name_ja"},
        name_kr: {type: String?, key: "Name_kr"},
        url: {type: String, key: "Url"},
      )

      # id of the item represented in the lore
      getter id
      # icon for the piece of lore
      getter icon
      # name in the api language
      getter name
      # name of the item in chinese
      getter name_cn
      # name of the item in german
      getter name_de
      # name of the item in english
      getter name_en
      # name of the item in french
      getter name_fr
      # name of the item in japanese
      getter name_ja
      # name of the item in korean
      getter name_kr
      # url of the page of the item in the lore
      getter url
    end

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
