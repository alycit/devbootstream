module InstagramAPI
  extend self

  DBCSF_instagram_id = 16169461
  DBCSF_lat = "37.792351477"
  DBCSF_long = "-122.406151383"

  DBCChicago_instagram_id = 68855928
  DBCChicago_lat = "41.889714"
  DBCChicago_long = "-87.63719"

  tags = ['devbootcamp']
  coordinate_tags = ['ruby', 'rails', 'dbc', 'javascript'] #implement in the future

  def instagram_ids
    [DBCSF_instagram_id, DBCChicago_instagram_id]
  end

  def instagram_resource
    Resource.find_by_user_name_and_source("public", "instagram")
  end

  def caption(obj)
    obj.caption.nil? ? "" : obj.caption.text
  end

  def dbc_location_search
    instagram_ids.each do |id|
      Instagram.location_recent_media(id).each do |obj|
        instagram_resource.posts.create( caption: caption(obj),
          media_type: 'photo',
          posted_at: DateTime.strptime(obj.created_time, '%s'),
          url: obj.images.standard_resolution.url
          )
      end

    end
  end

  def tags_search
    tags.each do |tag|
      Instagram.tag_recent_media(tag).each do |obj|
        instagram_resource.posts.create( caption: obj.caption.text,
          media_type: 'photo',
          posted_at: DateTime.strptime(obj.created_time, '%s'),
          url: obj.images.standard_resolution.url
          )
      end
    end
  end
end

# def client 
#   Instagram.client(:access_token => "357627834.3bdcc20.299991d0a5b24034bae7bc68f189e6a0")
# end


# def user_media(id)
#   p = client.user_recent_media(id).first
#   Resource.find(2).posts.create(caption: p.caption.text,
#    media_type: 'photo',
#    posted_at: DateTime.strptime(p.created_time, '%s'),
#    url: p.images.standard_resolution.url)

# end
# def user(username)
#   t = Instagram.user_search(username).first
#   Resource.find(2).posts.create(title: t.full_name, media_type: 'photo', posted_at: DateTime.now )
# end

# access_token = "357627834.3bdcc20.299991d0a5b24034bae7bc68f189e6a0"

# def dbc_location_id_search
#   Instagram.media_search(DBCSF_lat, DBCSF_long).each do |obj|
#     Resource.find(2).posts.create( caption: obj.caption.text,
#      media_type: 'photo',
#      posted_at: DateTime.strptime(obj.created_time, '%s'),
#      url: obj.images.standard_resolution.url
#      )
#   end
# end
