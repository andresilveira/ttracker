require_relative './spec_helper'

require 'rack/test'

class MiniTest::Spec
  include Rack::Test::Methods

  def app
    Lotus::Container.new
  end
end
