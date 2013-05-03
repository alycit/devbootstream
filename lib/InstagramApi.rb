module InstagramAPI
  extend self
  DBCSF_lat = "37.79221"
  DBCSF_long = "-122.406141"

  def user(username)
    t = Instagram.user_search(username).first
    Resource.find(2).posts.create(title: t.full_name, media_type: 'photo', posted_at: DateTime.now )
  end
#find(2) = "find_by_username(username)..."
  def geolocation_search
    Instagram.media_search(DBCSF_lat, DBCSF_long).each do |obj|
    Resource.find(2).posts.create( caption: obj.caption.text,
                                   media_type: 'photo',
                                   posted_at: DateTime.strptime(obj.created_time, '%s'),
                                   url: obj.images.standard_resolution.url
                                  )
  end 

#find(2) = same story...
end
