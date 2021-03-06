require 'spec_helper'
require_relative '../../../../apps/web/controllers/items/new'

describe Web::Controllers::Items::New do
  let(:action) { Web::Controllers::Items::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
