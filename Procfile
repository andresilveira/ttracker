web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -r ./lib/ttracker/workers/entries_getter.rb -c 5
