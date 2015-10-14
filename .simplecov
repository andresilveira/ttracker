SimpleCov.start do
  add_filter 'spec/'
  add_filter 'config/'
  add_filter 'lib/ttracker.rb'
  add_filter 'application.rb'

  add_group 'Entities', '/entities/'
  add_group 'Repositories', '/repositories'
  add_group 'Controllers', '/controllers/'
  add_group 'Views', '/views/'
  add_group 'Services', '/services'
end
