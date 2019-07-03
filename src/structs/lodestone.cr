require "json"
require "./devblog"
require "./devpost"
require "./news"
require "./notice"
require "./status"

module XIVAPI
  module Structs
    # Struct for Character Details specifically for lodestone data
    struct LodestoneCharacter
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        avatar: {type: String, key: "Avatar"},
        id: {type: UInt64, key: "ID"},
        name: {type: String, key: "Name"},
        server: {type: String, key: "Server"},
      )
      # The URL of the Character's Avatar
      getter avatar
      # The Lodestone ID of the Character
      getter id
      # The Character's Name
      getter name
      # The Server that the Character plays on
      getter server
    end

    # Struct for data about individual banners returned from the /lodestone endpoint
    struct LodestoneBanner
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        banner: {type: String, key: "Banner"},
        url: {type: String, key: "Url"},
      )
      # The image url for the banner
      getter banner
      # The url that clicking the banner would take you
      getter url
    end

    # Struct for the entire response from the `/lodestone` endpoint
    struct Lodestone
      # define a JSON mapping to create instances of this struct
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
