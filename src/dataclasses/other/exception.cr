require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for Exceptions returned from the API.
    # This class will be used to generate custom exception instances.
    class Exception
      include JSON::Serializable

      # A flag stating if the exception was an error or not.
      @[JSON::Field(key: "Error")]
      getter error : Bool
      # String indicating the type of exception that was received.
      @[JSON::Field(key: "Subject")]
      getter subject : String
      # The exception message from the API.
      @[JSON::Field(key: "Message")]
      getter message : String
      # A sha1 trackable hash of the exception.
      @[JSON::Field(key: "Hash")]
      getter hash : String
      # The name of the exception that was thrown.
      @[JSON::Field(key: "Ex")]
      getter exception_type : String
      # Extra arbitrary data that helps the API devs understand bugs.
      # Do not code against this classure as it can change at any time.
      @[JSON::Field(key: "Debug")]
      getter debug : JSON::Any
    end
  end
end
