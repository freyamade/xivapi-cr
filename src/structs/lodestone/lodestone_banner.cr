require "json"

module XIVAPI
  module Structs
    # Struct for data about individual banners returned from the /lodestone endpoint
    struct LodestoneBanner
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        banner: {type: String, key: "Banner"},
        url: {type: String, key: "Url"},
      )
      # The image URL for the banner.
      getter banner
      # The URL that clicking the banner would take you.
      getter url
    end
  end
end
