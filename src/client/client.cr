require "http/client"
require "http/params"
require "../dataclasses"
require "../exceptions"

module XIVAPI
  # Top level API client to interact with the API
  API_URL = "https://xivapi.com"
  # Top level API client to interact with the staging API
  STAGE_URL = "https://staging.xivapi.com"
  # The allowed language options
  LANGUAGE_OPTIONS = %w(en ja de fr cn kr)

  class Client
    @api_key : String
    @staging : Bool = false
    @language : String = "en"
    @url : String = API_URL

    def initialize(@api_key : String = "", language : String = "en", staging : Bool = false)
      # Use the setter method for language to ensure it's in the array of allowed languages
      self.staging = staging
      self.language = language
    end

    # Set the staging value of the client.
    # This method automatically updates the API url to the appropriate value
    def staging=(staging : Bool)
      @staging = staging
      @url = staging ? STAGE_URL : API_URL
    end

    # Set the language of the client by ensuring it's in the array of allowed languages
    def language=(language : String)
      language = language.downcase
      raise ArgumentError.new("Unsupported language: #{language}. Allowed choices are #{LANGUAGE_OPTIONS}.") unless LANGUAGE_OPTIONS.includes? language
      @language = language
    end

    # Make a request to a specific endpoint and return the HTTP body of the response, to be parsed in other methods.
    # Attaches the supplied endpoint to the the current in-use url value.
    # Also extends the client's instance variables into the supplied params hash.
    private def request(endpoint : String, params : Hash(String, String) = {} of String => String) : String
      params.merge! default_params
      # Remove empty values from the dict
      params.delete_if { |k, v| v == "" }
      endpoint = "#{endpoint}?#{HTTP::Params.encode params}".lstrip "/"
      url = "#{@url}/#{endpoint}"
      return HTTP::Client.get(url).body
    end

    # Return a Hash of the default parameters that should be added in every request.
    # These are currently; api_key, language
    def default_params : Hash(String, String)
      return {"private_key" => @api_key, "language" => @language, "extended" => "1"}
    end

    # The api key for the client, can be changed while in use
    property api_key
    # A flag stating whether or not requests should use the stage version of the API
    getter staging
    # The current language being used as the default for the requests
    getter language
  end
end
