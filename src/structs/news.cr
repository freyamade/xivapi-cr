require "json"

module XIVAPI
  module Structs
    # Struct for news posts
    struct News
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        banner: {type: String, key: "Banner"},
        html: {type: String, key: "Html"},
        time: {type: Time, key: "Time", converter: Time::EpochConverter},
        title: {type: String, key: "Title"},
        url: {type: String, key: "Url"},
      )
      # Url to the banner for the news item
      getter banner
      # HTML content for the news post
      getter html
      # Timestamp showing the date and time the post was made
      getter time
      # Title of the update post
      getter title
      # Url to the post itself
      getter url
    end
  end
end
