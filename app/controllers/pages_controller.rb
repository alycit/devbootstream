class PagesController < ApplicationController

  def index
    @posts = Post.order("posted_at DESC").limit(50)
  end
    
  def search
    @posts = Post.search(params[:q]).limit(10)
    render :index
  end

end
