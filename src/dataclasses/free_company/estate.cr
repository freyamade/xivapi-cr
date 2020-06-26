require "json"

module XIVAPI
  module Dataclasses
    # Dataclass containing details about a Free Company Estate.
    class Estate
      include JSON::Serializable
      # The greeting message for the Estate.
      @[JSON::Field(key: "Greeting")]
      getter greeting : String
      # The Estate's name.
      @[JSON::Field(key: "Name")]
      getter name : String
      # The Estate's plot details.
      @[JSON::Field(key: "Plot")]
      getter plot : String
    end
  end
end
