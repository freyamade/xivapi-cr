require "json"

module XIVAPI
  module Dataclasses
    # Dataclass for Exceptions returned from the API.
    # This class will be used to generate custom exception instances.
    class Exception
      # define a JSON mapping to create instances of this class
      JSON.mapping(
        error: {type: Bool, key: "Error"},
        subject: {type: String, key: "Subject"},
        message: {type: String, key: "Message"},
        hash: {type: String, key: "Hash"},
        exception_type: {type: String, key: "Ex"},
        debug: {type: JSON::Any, key: "Debug"},
      )

      # A flag stating if the exception was an error or not.
      getter error
      # String indicating the type of exception that was received.
      getter subject
      # The exception message from the API.
      getter message
      # A sha1 trackable hash of the exception.
      getter hash
      # The name of the exception that was thrown.
      getter exception_type
      # Extra arbitrary data that helps the API devs understand bugs.
      # Do not code against this classure as it can change at any time.
      getter debug
    end
  end
end
