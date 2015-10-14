require 'spec_helper'
require_relative '../../../../apps/web/views/items/destroy'

class DeleteItemParams < Lotus::Action::Params
  param :id, presence: true
end

describe Web::Views::Items::Destroy do
  let(:exposures) { Hash[] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/items/index.html.haml') }
  let(:view)      { Web::Views::Items::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }
end
