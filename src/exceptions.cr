require "./dataclasses/other/exception"

module XIVAPI
  # Module containing custom exceptions for the API.
  # Our base exception class just wraps the `Dataclasses::Exception` datatype into a Crystal exception that can be raised.
  module Exceptions
    class BaseXIVAPIException < Exception
      @api_exception : Dataclasses::Exception

      def initialize(@api_exception : Dataclasses::Exception)
      end

      # A `Dataclasses::Exception` instance containing exception information from the API.
      getter api_exception
    end
  end
end
