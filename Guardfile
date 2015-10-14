group :remote do
  guard :minitest, all_on_start: false, env: { TEST_REMOTE: true } do
    watch(%r{^spec/(.*)_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})                   { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^spec/spec_helper\.rb$})           { 'spec' }
  end
end

group :non_remote do
  guard :minitest, all_on_start: false, env: { TEST_REMOTE: true } do
    watch(%r{^spec/(?!.*api)(.*)_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})                   { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^spec/spec_helper\.rb$})           { 'spec' }
  end
end
