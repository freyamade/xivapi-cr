require "json"
require "../utils/name"

module XIVAPI
  module Dataclasses
    # Dataclass containing details about Devblog posts.
    class Devblog
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        author: NameLowcase,
        content: String,
        id: String,
        link: JSON::Any,
        published: String,
        summary: String,
        title: String,
        updated: String
      )
      # A `Name` class containing the name of the Devblog author.
      getter author
      # The HTML content of the blog post.
      getter content
      # The ID of the blog post.
      getter id
      # Extra link details in `JSON::Any` form until we can narrow down a class definition for it.
      getter link
      # ISO Format timestamp of the date and time the post was published initially.
      getter published
      # Brief summary of the post.
      getter summary
      # Title of the post.
      getter title
      # ISO Format timestamp of the date and time the post was last updated.
      getter updated
    end
  end
end
