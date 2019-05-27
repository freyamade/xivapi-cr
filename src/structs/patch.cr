require "json"

module XIVAPI
  module Structs
    # Struct for individual entries in the patch list
    struct Patch
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        banner: {type: String, key: "Banner"},
        ex_version: {type: Int32, key: "ExVersion"},
        id: {type: Int32, key: "ID"},
        name: {type: String, key: "Name"},
        name_cn: {type: String?, key: "Name_cn"},
        name_de: {type: String?, key: "Name_de"},
        name_en: {type: String?, key: "Name_en"},
        name_fr: {type: String?, key: "Name_fr"},
        name_ja: {type: String?, key: "Name_ja"},
        name_kr: {type: String?, key: "Name_kr"},
        release_date: {type: Time, key: "ReleaseDate", converter: Time::EpochConverter},
        version: {type: String, key: "Version"}
      )
      # url to the image used for the banner of the patch notes
      getter banner
      # the ID to the file (https://xivapi.com/ExVersion/{id})
      getter ex_version
      # the internal XIVAPI ID for the patch
      getter id
      # the name of the patch in the requested language
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
      # the date and time that the patch was released.
      # the API sends this in epoch format, but the library converts it to and from this format to native `Time` objects
      getter release_date
      # the version code as a string
      getter version
    end
  end
end
