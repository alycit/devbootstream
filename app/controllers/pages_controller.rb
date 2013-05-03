require_relative "../../lib/InstagramApi"

class PagesController < ApplicationController

  include InstagramApi

  def index
    # puts "i'm in here"
    # t = Instagram.user_search("armynante").first

    # Post.create(username: t.full_name, image_url: t.profile_picture)
    InstagramApi.user("armynante")
  end
end
