require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'simplecov'
SimpleCov.start

ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/reporters'

Lotus::Application.preload!

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

MinitestVcr::Spec.configure!
