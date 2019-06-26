module XIVAPI
  # Top level API client to interact with the API
  class Client
    @api_key : String
    @staging : Bool
    @language : String = "en"
    @poll_rate : UInt32

    def initialize(@api_key : String = "", language : String = "en", @poll_rate : UInt32 = 5, @staging : Bool = false)
      # Use the setter method for language to ensure it's in the array of allowed languages
      self.language = language
    end

    # Set the language of the client by ensuring it's in the array of allowed languages
    def language=(language : String)
      language = language.downcase
      raise ArgumentError, "Unsupported language: #{language}. Allowed choices are #{LANGUAGE_OPTIONS}." unless LANGUAGE_OPTIONS.includes? language
      @language = language
    end

    # Get a hash map of default parameters for requests
    def default_params
      return {
        private_key: @api_key,
        language:    @language,
      }
    end

    # The api key for the client, can be changed while in use
    property api_key
    # A flag stating whether or not requests should use the stage version of the API
    property staging
    # The current language being used as the default for the requests
    getter language
    # The rate at which to poll cached requests
    property poll_rate
  end
end
