# require_relative "../../lib/InstagramAPI"

class PagesController < ApplicationController
  # include InstagramAPI

  def index

    # InstagramAPI.dbc_location_search

    # InstagramAPI.get_instagrams
    @posts = Post.order("posted_at DESC").limit(50)
  end
    
  def search
    @posts = Post.basic_search(body: params[:q]).limit(10)
    render :index
  end

end
