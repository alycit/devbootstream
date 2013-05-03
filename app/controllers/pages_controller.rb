require_relative "../../lib/InstagramAPI"

class PagesController < ApplicationController

  include InstagramAPI

  def index
    # puts "i'm in here"
    # t = Instagram.user_search("armynante").first

    # Post.create(username: t.full_name, image_url: t.profile_picture)
    InstagramAPI.user_media(357627834)

    render :nothing => true
  end

end
