require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for status post data
    class Status
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        tag: {type: String, key: "Tag"},
        time: {type: Time, key: "Time", converter: Time::EpochConverter},
        title: {type: String, key: "Title"},
        url: {type: String, key: "Url"},
      )
      # The tag for the status post indicating the type of the post.
      getter tag
      # Timestamp showing the date and time the post was made.
      getter time
      # Title of the status post.
      getter title
      # URL to the post itself.
      getter url
    end
  end
end
