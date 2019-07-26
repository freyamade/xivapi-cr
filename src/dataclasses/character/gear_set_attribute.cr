require "json"
require "../utils/id_name"

module XIVAPI
  module Dataclasses
    # Dataclass for an attribute for a GearSet.
    # An Attribute corresponds to a stat, and has both a name and a value.
    class GearSetAttribute
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        attribute: {type: IDName, key: "Attribute"},
        value: {type: UInt64, key: "Value"},
      )
      # An `IDName` class containing the name and id of the attribute, e.g. Piety
      getter attribute
      # The value of the attribute generated by the Gear in the GearSet.
      getter value
    end
  end
end
