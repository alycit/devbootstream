class TumblrWorker
 include Sidekiq::Worker
 sidekiq_options :retry=>false

  def perform
    resource = Resource.first
    client = Tumblr::Client.new
    posts = client.posts(resource.entry)

    posts["posts"].each do |post|
      resource.posts.create(:blob=>post)
    end
    puts 'Doing hard workwww'
  end
end
