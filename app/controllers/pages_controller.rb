require_relative "../../lib/InstagramAPI"

class PagesController < ApplicationController
  include InstagramAPI

  def index
    InstagramAPI.get_instagrams

    @posts = Post.all
  end

end
