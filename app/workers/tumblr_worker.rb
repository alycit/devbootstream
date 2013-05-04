class TumblrWorker
 include Sidekiq::Worker
 sidekiq_options :retry=>false

  def perform
    resources = Resource.tumblr.all
    client = Tumblr::Client.new

    resources.each do |resource|
      #todo: refactor
      offset = 0
      save = true

      while save
        data = client.posts(resource.identifier)
        break if data["status"] == 404
        offset = data["posts"].length

        puts resource.identifier
        save = false
        data["posts"].each do |post|
          resource.posts.new(
            :media_type=>post["type"],
            :url=>post["url"],
            :body=>post["body"],
            :title=>post["title"],
            :posted_at => DateTime.strptime(post["timestamp"].to_s,"%s"),
            :data => post
          )
          save = resource.save
          offset = 0 unless save
        end

      end
    end

  end
end
