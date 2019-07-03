require "json"

module XIVAPI
  module Structs
    # Struct for an item category
    struct Category
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        category: {type: Int32?, key: "Category"},
        class_job_target: {type: String?, key: "ClassJobTarget"},
        class_job_target_id: {type: UInt64?, key: "ClassJobTargetID"},
        id: {type: UInt64?, key: "ID"},
        icon: {type: String?, key: "Icon"},
        icon_id: {type: UInt64?, key: "IconID"},
        name: {type: String?, key: "Name"},
        name_de: {type: String?, key: "Name_de"},
        name_en: {type: String?, key: "Name_en"},
        name_fr: {type: String?, key: "Name_fr"},
        name_ja: {type: String?, key: "Name_ja"},
        order: {type: Int32?, key: "Order"},
        url: {type: String?, key: "Url"},
      )
      # the category
      getter category
      # the class job target
      getter class_job_target
      # the id for the class job target
      getter class_job_target_id
      # the item search category id
      getter id
      # url to the icon
      getter icon
      # id of the icon
      getter icon_id
      # name of the category
      getter name
      # German name of the category
      getter name_de
      # English name of the category
      getter name_en
      # French name of the category
      getter name_fr
      # Japenese name of the category
      getter name_ja
      # order of the category
      getter order
      # url for item search of the category
      getter url
    end
  end
end
