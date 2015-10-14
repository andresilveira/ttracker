# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/reporters'

Lotus::Application.preload!

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]
