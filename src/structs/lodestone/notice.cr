require "json"

module XIVAPI
  module Structs
    # Struct for notices and update posts.
    struct Notice
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        time: {type: Time, key: "Time", converter: Time::EpochConverter},
        title: {type: String, key: "Title"},
        url: {type: String, key: "Url"},
      )
      # Timestamp showing the date and time the post was made.
      getter time
      # Title of the update post.
      getter title
      # URL to the post itself.
      getter url
    end
  end
end
