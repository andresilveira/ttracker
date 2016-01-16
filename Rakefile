ENV['LOTUS_ENV'] ||= 'test'

require 'rake'
require 'rake/testtask'
require 'lotus/rake_tasks'
require_relative './config/environment'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'spec'
end

task default: :test
task spec: :test

Dir.glob('./lib/ttracker/tasks/*.rake').each { |file| import file }
