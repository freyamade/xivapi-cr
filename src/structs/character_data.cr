require "json"

module XIVAPI
  module Structs
    # Struct for all character data structs
    struct CharacterData
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        active_class_job: {type: Structs::ClassJob, key: "ActiveClassJob"},
        avatar: {type: String?, key: "Avatar"},
        bio: {type: String?, key: "Bio"},
        class_jobs: {type: HashMap(String, Structs::ClassJob)?, key: "ClassJobs"},
        free_compay_id: {type: String?, key: "FreeCompanyId"},
        gear_set: {type: Structs::GearSet?, key: "GearSet"},
        gender: {type: Int32?, key: "Gender"},
        gender_id: {type: Int32?, key: "GenderID"},
        grand_company: {type: Structs::GrandCompany?, key: "GrandCompany"},
        guardian_diety: {type: Structs::GuardianDiety?, key: "GuardianDiety"},
        id: {type: Int32?, key: "ID"},
        minions: {type: Array(Structs::MinionMount)?, key: "Minions"},
        minions_count: {type: Int32?, key: "MinionsCount"},
        minions_progress: {type: String?, key: "MinionsProgress"},
        minions_total: {type: Int32?, key: "MinionsTotal"},
        mounts: {type: Array(Structs::MinionMount)?, key: "Mounts"},
        mounts_count: {type: Int32?, key: "MountsCount"},
        mounts_progress: {type: String?, key: "MountsProgress"},
        mounts_total: {type: Int32?, key: "MountsTotal"},
        name: {type: String?, key: "Name"},
        nameday: {type: String?, key: "Nameday"},
        parse_date: {type: Time?, key: "ParseDate", converter: Time::EpochConverter},
        portrait: {type: String?, key: "Portrait"},
        pvp_team_id: {type: Int32?, key: "PvPTeamId"},
        race: {type: Structs::Race?, key: "Race"},
        server: {type: String?, key: "Server"},
        title: {type: Structs::TitleTownTribe?, key: "Title"},
        town: {type: Structs::TitleTownTribe?, key: "Town"},
        tribe: {type: Structs::TitleTownTribe?, key: "Tribe"},
      )
      # the class job that the character currently is
      getter active_class_job
      # url to the avatar of the character
      getter avatar
      # the lodestone bio of the character
      getter bio
      # all class jobs of the character
      getter class_jobs
      # the id of the character's free company
      getter free_compay_id
      # the gear set of the character
      getter gear_set
      # the gender of the character (0 for female, 1 for male)
      getter gender
      # the genderID of the character (0 for female, 1 for male)
      getter gender_id
      # the grand company info of the character
      getter grand_company
      # the guardian diety info of the character
      getter guardian_diety
      # the id of the character
      getter id
      # the minions of the character
      getter minions
      # the number of minions owned by the character
      getter minions_count
      # the percent of total minions owned by the character
      getter minions_progress
      # the total number of minions
      getter minions_total
      # the mounts of the character
      getter mounts
      # the number of mounts owned by the character
      getter mounts_count
      # the percent of total mounts owned by the character
      getter mounts_progress
      # the total number of mounts
      getter mounts_total
      # the name of the character
      getter name
      # the nameday of the character
      getter nameday
      # the time at which the character data was last updated
      getter parse_date
      # url for the portrait of the character
      getter portrait
      # the id of the pvp team the character is in
      getter pvp_team_id
      # the race of the character
      getter race
      # the name of the server the character is on
      getter server
      # the title of the character
      getter title
      # the town of the character
      getter town
      # the tribe of the character
      getter tribe
    end
  end
end
