namespace :sidekiq do

  desc "tumblr test"
  task :start => :environment do
    TumblrWorker.perform_async
  end
  desc "instagram task"
  task :instagram_start => :environment do
    InstagramWorker.perform_async
  end
end
