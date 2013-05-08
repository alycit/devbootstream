class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render 'posts/show', :layout=>false
  end
end
