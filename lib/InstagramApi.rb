module InstagramApi
  extend self


  def user(username)
    t = Instagram.user_search(username).first

    Post.create(username: t.full_name, image_url: t.profile_picture)
  end

end



