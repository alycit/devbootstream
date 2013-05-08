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
        data = client.posts(resource.identifier, :offset=>offset)
        break if data["status"] == 404 #needs to be fixed
        logger.info "tumblr fetching #{resource.identifier}"
        offset += data["posts"].length
        author = data["blog"]["name"]
        author = author << " " << resource.boot.name unless resource.boot.nil?
        resource.update_attribute(:profile_pic_url, client.avatar(resource.identifier, 64))
        save = false

        data["posts"].each do |post|
          body = "#{author} #{ActionController::Base.helpers.strip_tags(post["body"])}"
          pst = resource.posts.new(
            :media_type=>post["type"],
            :url=>post["post_url"],
            :body=>  body,
            :title=> post["title"],
            :posted_at => DateTime.strptime(post["timestamp"].to_s,"%s"),
            :data => post
          )
          save = post.save
          offset = 0 unless save
        end

      end
    end

  end
end
