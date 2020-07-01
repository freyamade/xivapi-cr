require "json"
require "./estate"
require "./free_company_ranking"
require "./free_company_reputation"
require "./free_company_seeking"

module XIVAPI
  module Dataclasses
    # Dataclass containing the information about a Free Company.
    class FreeCompany
      include JSON::Serializable
      # A string indicating the active times of the Free Company.
      @[JSON::Field(key: "Active")]
      getter active : String
      # The number of active members in the Free Company.
      @[JSON::Field(key: "ActiveMemberCount")]
      getter active_member_count : UInt64
      # An array of URLs to the images that make up the crest for the Free Company.
      @[JSON::Field(key: "Crest")]
      getter crest : Array(String)
      # An `Estate` class containing details about the Free Company's Estate.
      @[JSON::Field(key: "Estate")]
      getter estate : Estate
      # An Array of `FreeCompanySeeking` classs indicating what the focuses of the Free Company are.
      @[JSON::Field(key: "Focus")]
      getter focus : Array(FreeCompanySeeking)
      # Timestamp of when the Free Company formed.
      @[JSON::Field(key: "Formed", converter: Time::EpochConverter)]
      getter formed : Time
      # The name of the Free Company's presiding Grand Company
      @[JSON::Field(key: "GrandCompany")]
      getter grand_company : String
      # The Lodestone ID of the Free Company
      @[JSON::Field(key: "ID")]
      getter id : String
      # The Free Company's name
      @[JSON::Field(key: "Name")]
      getter name : String
      # Integer rank of the Free Company
      @[JSON::Field(key: "Rank")]
      getter rank : UInt8
      # A `FreeCompanyRanking` class containing the Free Company's rankings.
      @[JSON::Field(key: "Ranking")]
      getter ranking : FreeCompanyRanking
      # A string representing the recruitment status of the Free Company.
      @[JSON::Field(key: "Recruitment")]
      getter recruitment : String
      # An Array of `FreeCompanyReputation` classes indicating the Free Company's reputation scores with the Grand Companies.
      @[JSON::Field(key: "Reputation")]
      getter reputation : Array(FreeCompanyReputation)
      # An array of `FreeCompanySeeking` classes indicating what the Free Company is currently seeking in terms of players.
      @[JSON::Field(key: "Seeking")]
      getter seeking : Array(FreeCompanySeeking)
      # Server the Free Company is in
      @[JSON::Field(key: "Server")]
      getter server : String
      # The Free Company's slogan.
      @[JSON::Field(key: "Slogan")]
      getter slogan : String
      # The Free Company's tag.
      @[JSON::Field(key: "Tag")]
      getter tag : String
    end
  end
end
