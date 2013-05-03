class TumblrWorker
 include Sidekiq::Worker
 sidekiq_options :retry=>false

  def perform
    resources = Resource.all
    client = Tumblr::Client.new

    resources.each do |resource|
      puts resource.identifier
      data = client.posts(resource.identifier)

      data["posts"].each do |post|
        #todo: need to account for repeat posts and new posts, but will have 
        #to wait for agreed validation
        resource.posts.new(
          :media_type=>post["type"],
          :url=>post["url"],
          :body=>post["body"],
          :title=>post["title"],
          :posted_at => DateTime.strptime(post["timestamp"].to_s,"%s"),
          :data => post
        )

        resource.save

      end
    end

  end
end
