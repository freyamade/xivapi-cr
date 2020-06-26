require "json"
require "./gear"
require "../utils/id_icon_name"
require "../utils/id_icon_name_url"

module XIVAPI
  module Dataclasses
    # Dataclass for a piece of Gear owned by a Character.
    # This class wraps the `Gear` class and adds extra, instanced details like dye, glamour and materia, as each character will have different copies of the same piece of `Gear`.
    class CharacterGear
      include JSON::Serializable
      # The ID of the Character that made the piece of equipment in question.
      @[JSON::Field(key: "Creator")]
      getter creator : UInt64?
      # An `IDIconName` class containing details about the dye currently on the Gear.
      @[JSON::Field(key: "Dye")]
      getter dye : IDIconName?
      # An `IDIconName` class containing information about the piece of Gear currently being used as a glamour for this piece of Gear.
      @[JSON::Field(key: "Mirage")]
      getter glamour : IDIconName?
      # A `GearItem` class that contains the details about the item that is equipped.
      @[JSON::Field(key: "Item")]
      getter item : Gear
      # An Array of `IDIconName` classs that corresponds to the list of Materia currently melded to the Equipped Gear.
      @[JSON::Field(key: "Materia")]
      getter materia : Array(IDIconNameUrl)
    end
  end
end
