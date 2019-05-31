require "json"

module XIVAPI
  module Structs
    # Struct for free company information
    struct FreeCompany
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        active: {type: String?, key: "Active"},
        active_member_count: {type: Int32?, key: "ActiveMemberCount"},
        crest: {type: Array(String)?, key: "Crest"},
        estate: {type: Structs::Estate?, key: "Estate"},
        focus: {type: Array(Structs::FocusSeeking)?, key: "Focus"},
        formed: {type: Time?, key: "Formed", converter: Time::EpochConverter},
        grand_company: {type: String?, key: "GrandCompany"},
        id: {type: String?, key: "ID"},
        name: {type: String?, key: "Name"},
        parse_date: {type: Time?, key: "ParseDate", converter: Time::EpochConverter},
        rank: {type: Int32?, key: "Rank"}
        ranking: {type: Structs::Ranking?, key: "Ranking"}
        recruitment: {type: String?, key: "Recruitment"}
        reputation: {type: Array(Structs::Reputation)?, key: "Reputation"}
        seeking: {type: Array(Structs::FocusSeeking)?, key: "Seeking"},
        server: {type: String?, key: "Server"},
        slogan: {type: String?, key: "Slogan"},
        tag: {type: String?, key: "Tag"}
      )
      # the activeness of the free company
      getter active
      # number of active members in the free company
      getter active_member_count
      # array of urls to images used to make free company crest
      getter crest
      # data on the free company estate
      getter estate
      # array of focuses of the free company
      getter focus
      # the time when the free company was formed
      getter formed
      # the name of the free company's grand company
      getter grand_company
      # the id of the free company
      getter id
      # the name of the free company
      getter name
      # the last time the data was updated
      getter parse_date
      # the rank of the free company
      getter rank
      # the weekly and monthly ranking of the free company
      getter ranking
      # the recruitment type of the free company
      getter recruitment
      # an array of the free company's reputation with the grand companies
      getter reputation
      # an array of what the free company is seeking
      getter seeking
      # the free company's slogan
      getter slogan
      # the free company's tag
      getter tag
    end
  end
end
