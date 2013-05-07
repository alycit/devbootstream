namespace :sidekiq do

  desc "tumblr test"
  task :start => :environment do
    #observers are disabled in the worker
    TumblrWorker.perform_async
  end
  desc "instagram task"
  task :instagram_start => :environment do
    #observers are disabled in the worker
    InstagramWorker.perform_async
  end

  desc "one time task to begin building twitter records for all boots in system"
  task :initial_twitter_populate => :environment do
    ActiveRecord::Base.observers.disable :all
    Resource.twitter.each do |twitter_resources|
      TwitterApi.slow_initial_populate(twitter_resources)
    end
  end

  desc "TweetStream worker that will listen for any new tweets"
  task :listen  => :environment do
    TwitterApi.update_new_tweets
  end

  desc "populate database with current instagrams matching DBC id's and DBC geo-coordinates"
  task :get_instagrams => :environment do
    ActiveRecord::Base.observers.disable :all
    InstagramApi.get_instagrams
  end

  desc "initial DB populate for instagrams and twitters"
  task :first_boot => :environment do
    ActiveRecord::Base.observers.disable :all
    Resource.twitter.each do |twitter_resources|
      TwitterApi.slow_initial_populate(twitter_resources)
    end

    InstagramApi.get_instagrams
  end

end
