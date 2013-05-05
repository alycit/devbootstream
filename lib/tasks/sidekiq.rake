require_relative '../../lib/TwitterApi'

namespace :sidekiq do

include TwitterApi

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
    Resource.twitter.each do |twitter_resources|
      TwitterApi.slow_initial_populate(twitter_resources)
    end
  end

  desc "TweetStream worker that will listen for any new tweets"
  task :listen  => :environment do
    TwitterApi.update_new_tweets
  end
end
