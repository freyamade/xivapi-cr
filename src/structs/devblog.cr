require "json"

module XIVAPI
  module Structs
    # Simple struct for devblog author details
    struct DevblogAuthor
      JSON.mapping(name: String)

      # The name of the author of the post
      getter name
    end

    # Struct for devblog posts
    struct Devblog
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        author: DevblogAuthor,
        content: String,
        id: String,
        link: JSON::Any,
        published: String,
        summary: String,
        title: String,
        updated: String
      )
      # Details of the author of the post
      getter author
      # The HTML content of the blog post
      getter content
      # The id of the blog post
      getter id
      # Extra link details
      getter link
      # ISO Format timestamp of the date and time the post was published initially
      getter published
      # Brief summary of the post
      getter summary
      # Title of the post
      getter title
      # ISO Format timestamp of the date and time the post was last updated
      getter updated
    end
  end
end
