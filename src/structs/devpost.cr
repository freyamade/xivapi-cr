require "json"

module XIVAPI
  module Structs
    # Struct for devposts
    struct Devpost
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        content: {type: String, key: "Content"},
        id: Int32,
        post_count: {type: Int32, key: "PostCount"},
        time: {type: Time, key: "Time", converter: Time::EpochConverter},
        url: {type: String, key: "Url"},
        user_avatar: {type: String, key: "UserAvatar"},
        user_colour: {type: String, key: "UserColour"},
        user_name: {type: String, key: "UserName"},
        user_signature: {type: String, key: "UserSignature"},
        user_title: {type: String, key: "UserTitle"},
      )
      # The content of the initial post
      getter content
      # The ID of the thread on the forum
      getter id
      # The number of posts in the thread
      getter post_count
      # The date and time the thread was posted
      getter time
      # The URL of the thread
      getter url
      # A URL to the avatar of the user who posted the thread
      getter user_avatar
      # The colour of the user who posted the thread
      getter user_colour
      # The name of the user who posted the thread
      getter user_name
      # The forum signature of the user who posted the thread
      getter user_signature
      # The title of the user that posted the thread
      getter user_title
    end
  end
end
