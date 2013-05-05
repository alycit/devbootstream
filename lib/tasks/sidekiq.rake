namespace :sidekiq do

  desc "tumblr test"
  task :start => :environment do
    TumblrWorker.perform_async
  end
  desc "instagram task"
  task :instagram_start => :environment do
    InstagramWorker.perform_async
  end

  desc "one time task to begin building twitter records for all boots in system"
  task :initial_twitter_populate => :environment do
    #TBD
  end
end
