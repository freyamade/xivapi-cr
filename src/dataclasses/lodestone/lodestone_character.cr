require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for Character Details specifically for lodestone data
    class LodestoneCharacter
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        avatar: {type: String, key: "Avatar"},
        id: {type: UInt64, key: "ID"},
        name: {type: String, key: "Name"},
        server: {type: String, key: "Server"},
      )
      # The URL of the Character's Avatar.
      getter avatar
      # The Lodestone ID of the Character.
      getter id
      # The Character's Name.
      getter name
      # The Server that the Character plays on.
      getter server
    end
  end
end
