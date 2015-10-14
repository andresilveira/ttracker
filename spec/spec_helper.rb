require "codeclimate-test-reporter" CodeClimate::TestReporter.start
require 'simplecov'
SimpleCov.start

ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/reporters'

Lotus::Application.preload!

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
