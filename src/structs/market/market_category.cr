require "json"

module XIVAPI
  module Structs
    # Struct for data that is returned from the list of market item categories.
    struct MarketCategory
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        category: {type: UInt64?, key: "Category"},
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
        order: {type: UInt64?, key: "Order"},
        url: {type: String?, key: "Url"},
      )
      # An integer representing the Category type.
      # I am as of yet unsure what each number represents however, but it seems like 1 => Weapons, 2 => Armour?
      getter category
      # A string that currently seems to only ever say "ClassJob", even for furnishings.
      getter class_job_target
      # The ID of the ClassJob for the Category.
      # Used for the different kinds of Gear to link back to the Class and Job that can use them.
      getter class_job_target_id
      # The ID of the Category.
      getter id
      # URL to the icon for the Category.
      getter icon
      # The ID of the icon for the Category
      getter icon_id
      # The name of the Category in the language chosen for the API.
      getter name
      # German name of the Category
      getter name_de
      # English name of the Category
      getter name_en
      # French name of the Category
      getter name_fr
      # Japenese name of the Category
      getter name_ja
      # Integer representing the position that the Category is displayed in on the Market Board.
      getter order
      # URL for the full details for the ItemSearchCategory that the MarketCategory represents.
      getter url
    end
  end
end
