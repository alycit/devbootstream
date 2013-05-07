class PostObserver < ActiveRecord::Observer
  def after_create(post)
    Pusher.trigger('bootstream', 'post_created', post.data)
    post.logger.info('pushed data to client')
  end
end
