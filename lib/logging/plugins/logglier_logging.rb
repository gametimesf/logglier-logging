module Logging
  module Plugins
    module LogglierLogging
      extend self

      VERSION = '1.0.0'.freeze

      def initialize_logglier_logging
        require File.expand_path('../../appenders/logglier_logging', __FILE__)
      end
    end
  end
end
