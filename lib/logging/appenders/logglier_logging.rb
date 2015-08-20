require 'logglier'

module Logging
  module Appenders

    # Accessor / Factory for the Logglier appender.
    def self.logglier_logging( *args )
      return ::Logging::Appenders::LogglierLogging if args.empty?
      ::Logging::Appenders::LogglierLogging.new(*args)
    end

    # Provides an appender that can send log messages to loggly

    class LogglierLogging < ::Logging::Appender
      attr_accessor :url, :loggly, :levels
      def initialize( name, opts = {} )
        opts[:header] = false
        super(name, opts)
        # customer token for loggly
        self.url = opts.fetch(:url)
        raise ArgumentError, 'Must specify url' if @url.nil?
        self.loggly = Logglier.new(@url, threaded: true, format: :json)
        self.levels = Logging::LEVELS.invert
      end

      def write(event)
        message = event.data.is_a?(Hash) ? event.data : { message: event.data }
        @loggly.public_send(@levels[event.level], message)
      end

      def close( *args )
        super(false)
      end

    end
  end
end
