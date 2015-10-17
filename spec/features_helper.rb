# Require this file for feature tests
require_relative './spec_helper'

require 'capybara'
require 'capybara/dsl'

Capybara.default_max_wait_time = 5
Capybara.app = Lotus::Container.new

class MiniTest::Spec
  include Capybara::DSL
end
