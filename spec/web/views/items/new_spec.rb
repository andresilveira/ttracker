require 'spec_helper'
require_relative '../../../../apps/web/views/items/new'

class NewItemParams < Lotus::Action::Params
  param :item do
    param :name, presence: true
  end
end

describe Web::Views::Items::New do
  let(:params)    { NewItemParams.new({}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/items/new.html.haml') }
  let(:view)      { Web::Views::Items::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "displays list of errors when params contains errors" do
    params.valid? # trigger validations

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('name is required')
  end
end
