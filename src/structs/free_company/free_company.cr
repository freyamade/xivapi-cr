require "json"
require "./estate"
require "./free_company_ranking"
require "./free_company_reputation"
require "./free_company_seeking"

module XIVAPI
  module Structs
    # Struct containing the information about a Free Company.
    struct FreeCompany
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        active: {type: String, key: "Active"},
        active_member_count: {type: UInt64, key: "ActiveMemberCount"},
        crest: {type: Array(String), key: "Crest"},
        estate: {type: Estate, key: "Estate"},
        focus: {type: Array(FreeCompanySeeking), key: "Focus"},
        formed: {type: Time, key: "Formed", converter: Time::EpochConverter},
        grand_company: {type: String, key: "GrandCompany"},
        id: {type: String, key: "ID"},
        name: {type: String, key: "Name"},
        parse_date: {type: Time, key: "ParseDate", converter: Time::EpochConverter},
        rank: {type: UInt8, key: "Rank"},
        ranking: {type: FreeCompanyRanking, key: "Ranking"},
        recruitment: {type: String, key: "Recruitment"},
        reputation: {type: Array(FreeCompanyReputation), key: "Reputation"},
        seeking: {type: Array(FreeCompanySeeking), key: "Seeking"},
        server: {type: String, key: "Server"},
        slogan: {type: String, key: "Slogan"},
        tag: {type: String, key: "Tag"}
      )
      # A string indicating the active times of the Free Company.
      getter active
      # The number of active members in the Free Company.
      getter active_member_count
      # An array of URLs to the images that make up the crest for the Free Company.
      getter crest
      # An `Estate` struct containing details about the Free Company's Estate.
      getter estate
      # An Array of `FreeCompanySeeking` structs indicating what the focuses of the Free Company are.
      getter focus
      # Timestamp of when the Free Company formed.
      getter formed
      # The name of the Free Company's presiding Grand Company
      getter grand_company
      # The Lodestone ID of the Free Company
      getter id
      # The Free Company's name
      getter name
      # Timestamp representing the last time the Free Company's data was pulled from the Lodestone into XIVAPI.
      getter parse_date
      # Integer rank of the Free Company
      getter rank
      # A `FreeCompanyRanking` struct containing the Free Company's rankings.
      getter ranking
      # A string representing the recruitment status of the Free Company.
      getter recruitment
      # An Array of `FreeCompanyReputation` structs indicating the Free Company's reputation scores with the Grand Companies.
      getter reputation
      # An array of `FreeCompanySeeking` structs indicating what the Free Company is currently seeking in terms of players.
      getter seeking
      # The Free Company's slogan.
      getter slogan
      # The Free Company's tag.
      getter tag
    end
  end
end
