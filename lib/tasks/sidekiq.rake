namespace :sidekiq do

  desc "tumblr test"
  task :start => :environment do
    TumblrWorker.perform_async
  end
end
