class TumblrWorker
 include Sidekiq::Worker
 sidekiq_options :retry=>false

  def perform
    resources = Resource.all
    client = Tumblr::Client.new

    resources.each do |resource|
      puts resource.identifier
      # data = client.posts(resource.identifier)

      # data["posts"].each do |post|

      #   resource.posts.create(
      #     :media_type=>post["type"],
      #     :url=>post["url"],
      #     :body=>post["body"],
      #     :title=>post["title"],
      #     :posted_at => post["timestamp"]
      #   )

      # end
    end

  end
end
