module XIVAPI
  # Custom XIVAPI Errors
  module Errors
    # Standard Request Error
    class RequestError < Exception
      def initialize(response)
        if response.headers[:content_type] =~ /json/
          message = JSON.parse(response)["Message"]
        else
          message = "Error contacting the API."
        end

        super(message)
      end
    end

    # Rate Limited
    class RateLimitError < Exception
      def initialize
        super("Too many requests")
      end
    end

    # Content not available
    class ContentNotAvailable < StandardError
      def initialize
        super("Content is not currently available on XIVAPI.")
      end
    end

    # Content not found
    class ContentNotFound < StandardError
      def initialize
        super("Content does not exist on the Lodestone.")
      end
    end

    # Content blacklisted
    class ContentBlacklisted < StandardError
      def initialize
        super("Content has been blacklisted.")
      end
    end

    # Content private
    class ContentPrivate < StandardError
      def initialize
        super("Content is private.")
      end
    end
  end
end
