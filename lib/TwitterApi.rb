module TwitterApi

  extend self

  def tags
    ['devbootcamp']
  end

  def twitter_resource
    Resource.find_by_user_name_and_source("public", "twitter")
  end

  def build_tweet_url(username, tweet_id)
    "https://twitter.com/#{username}/status/#{tweet_id}"
  end

  def create_tweet_post(resource, tweet)
    resource.posts.create(  url: build_tweet_url(tweet.user.screen_name, tweet.user.status.id),
      body: tweet.text,
      media_type: 'string',
      posted_at: tweet.created_at)
  end

  def pause_api_calls?
    puts "testing to pause with api_call = #{$api_calls}"
    if $api_calls == 2
      sleep(5.seconds)
      puts "sleeping for 5 seconds........................................." 
      $api_calls = 0
      puts "0 == #{$api_calls}"
      sleep(5.seconds)
    end
  end

  def tagged_tweets
    tags.each do |tag|
      Twitter.search(tag).results.each do |tweet|
        create_tweet_post(twitter_resource, tweet)
      end
    end
  end

  def slow_initial_populate(resource)
    tweets = Twitter.user_timeline(resource.identifier, :count => 100, :max_id => resource.oldest_tweet_id)
    puts "Oldest_tweet_id is #{resource.oldest_tweet_id}"
    $api_calls += 1
    puts "api call #{$api_calls}"
    pause_api_calls?
    if tweets.length > 1 && tweets.first.created_at > resource.boot.cohort.start_date - 30.days
      tweets.each do |tweet|
        puts "creating tweet #{Post.count}"
        create_tweet_post(resource, tweet)
      end
      slow_initial_populate(resource)
    end
  end

  def get_new_tweets(resource)
    tweets = Twitter.user_timeline(resource.identifier, :count => 100, :since_id => resource.newest_tweet_id)

    if tweets.length >= 1
      tweets.each do |tweet|
        create_tweet_post(resource, tweet)
      end
      get_new_tweets(resource)
    end
  end
end
