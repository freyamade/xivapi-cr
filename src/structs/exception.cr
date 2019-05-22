require "json"

module XIVAPI
  module Structs
    # Struct for Exceptions returned from the API
    struct Exception
      # define a JSON mapping to create instances of this struct
      JSON.mapping(
        error: {type: Bool, key: "Error"},
        subject: {type: String, key: "Subject"},
        message: {type: String, key: "Message"},
        hash: {type: String, key: "Hash"},
        exception_type: {type: String, key: "Ex"},
        debug: {type: JSON::Any, key: "Debug"},
      )

      # flag stating if the exception was an error or not
      getter error
      # the type of exception received
      getter subject
      # the exception message
      getter message
      # a sha1 trackable hash of the error message
      getter hash
      # the name of the exception thrown
      getter exception_type
      # extra arbitrary data that helps the API devs understand bugs.
      # do not code against this structure as it can change at any time
      getter datatype
    end
  end
end

test = %({
    "Error": true,
    "Subject": "XIVAPI Service Error",
    "Message": "The details of the error message",
    "Hash": "A sha1 trackable hash of the error message",
    "Ex": "The name of the exception thrown",
    "Debug": {
        
    }
})
str = XIVAPI::Structs::Exception.from_json test
puts str
