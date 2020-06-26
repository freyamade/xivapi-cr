require "json"
require "./linkshell"

module XIVAPI
  module Dataclasses
    # Dataclass for the response from the Linkshell read View.
    class LinkshellResponse
      include JSON::Serializable
      # A `Linkshell` object representing the data on the chosen Linkshell.
      @[JSON::Field(key: "Linkshell")]
      getter linkshell : Linkshell
    end
  end
end
