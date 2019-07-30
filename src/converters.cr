module XIVAPI
  # A module containing modules that convert to and from JSON
  module Converters
    module NilableEpochConverter
      def self.from_json(value : JSON::PullParser) : Time?
        time = value.read_int_or_null
        if !time.nil?
          return Time.unix(time)
        else
          return nil
        end
      end

      def self.to_json(value : Time?, io : IO)
        if value.nil?
          io << value
        else
          io << value.unix
        end
      end
    end
  end
end
