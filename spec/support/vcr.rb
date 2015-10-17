require 'vcr'
require 'minitest-vcr'

VCR.configure do |c|
  c.ignore_localhost = true
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.ignore_hosts 'codeclimate.com'
end

MinitestVcr::Spec.configure!
