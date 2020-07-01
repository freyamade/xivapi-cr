require "json"
require "./class_job"
require "./gear_set"
require "./grand_company_character_data"
require "./guardian_deity"
require "./minion_mount"
require "../utils/id_icon_name_url"
require "../utils/id_name_url"

module XIVAPI
  module Dataclasses
    # Dataclass containing a Character's data.
    class Character
      include JSON::Serializable
      # A `ClassJob` class representing the Class or Job the Character currently is at the time of the previous XIVAPI update.
      @[JSON::Field(key: "ActiveClassJob")]
      getter active_class_job : ClassJob?
      # URL to the avatar for the Character.
      # The avatar is a headshot of the Character, whereas the portrait is a full body image.
      @[JSON::Field(key: "Avatar")]
      getter avatar : String
      # The Lodestone bio of the Character.
      @[JSON::Field(key: "Bio")]
      getter bio : String
      # An array of `ClassJob` classes for all of the Classes and Jobs the Character currently has unlocked.
      @[JSON::Field(key: "ClassJobs")]
      getter class_jobs : Array(ClassJob)
      # The Lodestone ID of the Character's current Free Company
      @[JSON::Field(key: "FreeCompanyId")]
      getter free_company_id : String?
      # A `GearSet` class representing the Character's currently equipped Gear Set.
      @[JSON::Field(key: "GearSet")]
      getter gear_set : GearSet
      # An integer specifying the Character's gender. 1 is Male, 2 is Female.
      @[JSON::Field(key: "Gender")]
      getter gender : UInt8
      # A `GrandCompanyCharacterData` class containing the Character's Grand Company information.
      @[JSON::Field(key: "GrandCompany")]
      getter grand_company : GrandCompanyCharacterData?
      # A `GuardianDeity` class containing the Character's Guardian Deity information.
      @[JSON::Field(key: "GuardianDeity")]
      getter guardian_deity : GuardianDeity
      # The Lodestone ID of the Character.
      @[JSON::Field(key: "ID")]
      getter id : UInt64
      # An Array of `MinionMount` classs representing the Minions owned by the Character.
      @[JSON::Field(key: "Minions")]
      getter minions : Array(MinionMount)
      # An integer value for the number of Minions currently owned by the Character.
      @[JSON::Field(key: "MinionsCount")]
      getter minions_count : UInt64
      # A string value indicating the percentage of the total number of Minions that the Character currently owns.
      @[JSON::Field(key: "MinionsProgress", converter: String::RawConverter)]
      getter minions_progress : String
      # An integer representing the total number of Minions currently in XIVAPI.
      @[JSON::Field(key: "MinionsTotal")]
      getter minions_total : UInt64
      # An Array of `MinionMount` classs representing the Mounts owned by the Character.
      @[JSON::Field(key: "Mounts")]
      getter mounts : Array(MinionMount)
      # An integer value for the number of Mounts currently owned by the Character.
      @[JSON::Field(key: "MountsCount")]
      getter mounts_count : UInt64
      # A string value indicating the percentage of the total number of Mounts that the Character currently owns.
      @[JSON::Field(key: "MountsProgress", converter: String::RawConverter)]
      getter mounts_progress : String
      # An integer representing the total number of Mounts currently in XIVAPI.
      @[JSON::Field(key: "MountsTotal")]
      getter mounts_total : UInt64
      # The Character's name
      @[JSON::Field(key: "Name")]
      getter name : String
      # The Character's nameday
      @[JSON::Field(key: "Nameday")]
      getter nameday : String
      # URL for the Character's portrait.
      # The portrait is a full body image, whereas the avatar is only a headshot of the Character.
      @[JSON::Field(key: "Portrait")]
      getter portrait : String
      # The Lodestone ID of the Character's PVP Team
      @[JSON::Field(key: "PvPTeamId")]
      getter pvp_team_id : UInt64?
      # An `IDNameUrl` class containing the Character's racial information.
      @[JSON::Field(key: "Race")]
      getter race : IDNameUrl
      # The Server that the Character is currently in.
      @[JSON::Field(key: "Server")]
      getter server : String
      # An `IDIconNameUrl` class containing the details about the Character's current title.
      @[JSON::Field(key: "Title")]
      getter title : IDIconNameUrl?
      # An `IDIconNameUrl` class containing the details about the Character's starting town.
      @[JSON::Field(key: "Town")]
      getter town : IDIconNameUrl
      # An `IDNameUrl` class containing the details about the Character's race clan.
      # An Icon field is returned from the API but we've found this to normally be null so we have removed it.
      @[JSON::Field(key: "Tribe")]
      getter tribe : IDNameUrl
    end
  end
end
