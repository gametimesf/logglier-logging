Gem::Specification.new do |s|
  s.name = "logglier-logging"
  s.version = "0.0.1"

  s.authors = ["Eric Nicholas"]
  s.require_paths = ["lib"]
  s.date = "2015-08-20"
  s.description = "Appender for logging to loggly with logging gem"
  s.email = "eric@gametime.co"
  s.files = [
    "LICENSE",
    "logglier-logging.gemspec",
    "lib/logging/appenders/logglier_logging.rb",
    "lib/logging/plugins/logglier_logging.rb",
  ]
  s.homepage = "http://github.com/gametimesf/logglier-logging"
  s.summary = "appender for logging"

  s.add_dependency "logglier", '< 1.0.0'
end
