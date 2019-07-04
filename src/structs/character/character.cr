require "json"
require "./class_job"
require "./gear_set"
require "./grand_company_character_data"
require "./guardian_deity"

module XIVAPI
  module Structs
    # Struct containing a Character's data.
    struct Character
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        active_class_job: {type: Structs::ClassJob, key: "ActiveClassJob"},
        avatar: {type: String, key: "Avatar"},
        bio: {type: String, key: "Bio"},
        class_jobs: {type: Hash(String, Structs::ClassJob), key: "ClassJobs"},
        free_company_id: {type: String, key: "FreeCompanyId"},
        gear_set: {type: Structs::GearSet, key: "GearSet"},
        gender: {type: UInt8, key: "Gender"},
        grand_company: {type: Structs::GrandCompanyCharacterData, key: "GrandCompany"},
        guardian_deity: {type: Structs::GuardianDeity, key: "GuardianDeity"},
        id: {type: UInt64, key: "ID"},
        minions: {type: Array(Structs::MinionMount), key: "Minions"},
        minions_count: {type: UInt64, key: "MinionsCount"},
        minions_progress: {type: String, key: "MinionsProgress", converter: String::RawConverter},
        minions_total: {type: UInt64, key: "MinionsTotal"},
        mounts: {type: Array(Structs::MinionMount), key: "Mounts"},
        mounts_count: {type: UInt64, key: "MountsCount"},
        mounts_progress: {type: String, key: "MountsProgress", converter: String::RawConverter},
        mounts_total: {type: UInt64, key: "MountsTotal"},
        name: {type: String, key: "Name"},
        nameday: {type: String, key: "Nameday"},
        parse_date: {type: Time, key: "ParseDate", converter: Time::EpochConverter},
        portrait: {type: String, key: "Portrait"},
        pvp_team_id: {type: UInt64, key: "PvPTeamId"},
        race: {type: Structs::IDNameUrl, key: "Race"},
        server: {type: String, key: "Server"},
        title: {type: Structs::IDIconNameUrl, key: "Title"},
        town: {type: Structs::IDIconNameUrl, key: "Town"},
        tribe: {type: Structs::IDIconNameUrl, key: "Tribe"},
      )
      # A `ClassJob` struct representing the Class or Job the Character currently is at the time of the previous XIVAPI update.
      getter active_class_job
      # URL to the avatar for the Character.
      # The avatar is a headshot of the Character, whereas the portrait is a full body image.
      getter avatar
      # The Lodestone bio of the Character.
      getter bio
      # A Hash of strings to `ClassJob` structs for all of the Classes and Jobs the Character currently has unlocked.
      # The keys in this Hash are in the format `#{class_id}_#{job_id}`.
      getter class_jobs
      # The Lodestone ID of the Character's current Free Company
      getter free_company_id
      # A `GearSet` struct representing the Character's currently equipped Gear Set.
      getter gear_set
      # An integer specifying the Character's gender. 1 is Male, 2 is Female.
      getter gender
      # A `GrandCompanyCharacterData` struct containing the Character's Grand Company information.
      getter grand_company
      # A `GuardianDeity` struct containing the Character's Guardian Deity information.
      getter guardian_deity
      # The Lodestone ID of the Character.
      getter id
      # An Array of `MinionMount` structs representing the Minions owned by the Character.
      getter minions
      # An integer value for the number of Minions currently owned by the Character.
      getter minions_count
      # A string value indicating the percentage of the total number of Minions that the Character currently owns.
      getter minions_progress
      # An integer representing the total number of Minions currently in XIVAPI.
      getter minions_total
      # An Array of `MinionMount` structs representing the Mounts owned by the Character.
      getter mounts
      # An integer value for the number of Mounts currently owned by the Character.
      getter mounts_count
      # A string value indicating the percentage of the total number of Mounts that the Character currently owns.
      getter mounts_progress
      # An integer representing the total number of Mounts currently in XIVAPI.
      getter mounts_total
      # The Character's name
      getter name
      # The Character's nameday
      getter nameday
      # Timestamp representing the last time the Character's data was pulled from the Lodestone into XIVAPI.
      getter parse_date
      # URL for the Character's portrait.
      # The portrait is a full body image, whereas the avatar is only a headshot of the Character.
      getter portrait
      # The Lodestone ID of the Character's PVP Team
      getter pvp_team_id
      # An `IDNameUrl` struct containing the Character's racial information.
      getter race
      # The Server that the Character is currently in.
      getter server
      # An `IDIconNameUrl` struct containing the details about the Character's current title.
      getter title
      # An `IDIconNameUrl` struct containing the details about the Character's starting town.
      getter town
      # An `IDIconNameUrl` struct containing the details about the Character's race clan.
      getter tribe
    end
  end
end
