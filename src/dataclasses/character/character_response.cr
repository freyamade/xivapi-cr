require "json"
require "./achievements"
require "./character"
require "./character_summary"
require "./minion_mount"
require "../free_company"
require "../pvp_team"

module XIVAPI
  module Dataclasses
    # A class used to map out the response from the Character endpoint.
    # Currently, this class contains the entire data using the `extended=1` flag, but columns are still specifiable for the requests.
    class CharacterResponse
      include JSON::Serializable
      # An `Achievements` class containing all of the Character's Achievements data.
      # Will be `nil` unless the Achievements data (AC) is requested.
      @[JSON::Field(key: "Achievements")]
      getter achievements : Achievements?
      # A `CharacterData` class containing the actual data about the Character.
      @[JSON::Field(key: "Character")]
      getter character : Character
      # A `FreeCompany` class representing the Character's Free Company.
      # Will be `nil` unless the Free Company data (FC) is requested, or if it is not yet in the system.
      @[JSON::Field(key: "FreeCompany")]
      getter free_company : FreeCompany?
      # An Array of `CharacterSummary` classs with details about the members of the Character's Free Company.
      # Will be `nil` unless the Free Company Members data (FCM) is requested, or if it is not yet in the system.
      @[JSON::Field(key: "FreeCompanyMembers")]
      getter free_company_members : Array(CharacterSummary)?
      # An Array of `CharacterSummary` classs with details about the Character's friends.
      # Will be `nil` unless the Friends List data (FR) is requested.
      @[JSON::Field(key: "Friends")]
      getter friends : Array(CharacterSummary)?
      # A `PvpTeam` class representing the Character's PVP Team.
      # Will be `nil` unless the PVP Team data (PVP) is requested, or if it is not yet in the system.
      @[JSON::Field(key: "PvPTeam")]
      getter pvp_team : PvpTeam?
      # An array of `MinionMount` classes representing minions owned
      # Will be `nil` unless the Minion & Mount data (MIMO) is requested.
      @[JSON::Field(key: "Minions")]
      getter minions : Array(MinionMount)?
      # An array of `MinionMount` classes representing mounts owned
      # Will be `nil` unless the Minion & Mount data (MIMO) is requested.
      @[JSON::Field(key: "Mounts")]
      getter mounts : Array(MinionMount)?
    end
  end
end
