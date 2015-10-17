ENV['LOTUS_ENV'] ||= 'test'

require_relative 'support/test_coverage'
require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'support/vcr'

Lotus::Application.preload!

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
