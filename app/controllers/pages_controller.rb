# require_relative "../../lib/InstagramAPI"

class PagesController < ApplicationController
  # include InstagramAPI

  def index

    # InstagramAPI.dbc_location_search

    InstagramAPI.get_instagrams

    @posts = Post.all(:limit => 50)
    
  end

end
