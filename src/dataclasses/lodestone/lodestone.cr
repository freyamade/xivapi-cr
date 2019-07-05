require "json"
require "./devblog"
require "./devpost"
require "./news"
require "./notice"
require "./status"

module XIVAPI
  module Dataclasses
    # Dataclass for the entire response from the `/lodestone` endpoint
    class Lodestone
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        banners: {type: Array(LodestoneBanner), key: "Banners"},
        dev_blog: {type: Array(Devblog), key: "DevBlog"},
        dev_posts: {type: Array(Devpost), key: "DevPosts"},
        generated: {type: Time, key: "Generated", converter: Time::EpochConverter},
        maintenance: {type: Array(Status), key: "Maintenance"},
        news: {type: Array(News), key: "News"},
        notices: {type: Array(Notice), key: "Notices"},
        status: {type: Array(Status), key: "Status"},
        topics: {type: Array(News), key: "Topics"},
        updates: {type: Array(Notice), key: "Updates"},
      )
      # An array of banners that are currently being displayed in the lodestone
      getter banners
      # An array of devblog posts that are currently up on the lodestone
      getter dev_blog
      # An array of devposts that are currently up on the lodestone
      getter dev_posts
      # Timestamp representing the last time that this data was generated
      getter generated
      # An array of maintenance reports from the lodestone
      getter maintenance
      # An array of news posts from the lodestone
      getter news
      # An array of notices from the lodestone
      getter notices
      # An array of status posts from the lodestone
      getter status
      # An array of topics from the lodestone
      getter topics
      # An array of update posts from the lodestone
      getter updates
    end
  end
end
