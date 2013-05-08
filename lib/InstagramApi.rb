module InstagramApi
  extend self

  def coordinate_tags
    ['ruby', 'devbootcamp', 'rails', 'dbc', 'javascript']
  end

  def tags
    ['devbootcamp']
  end
  
  def sf_coordinates
    ["37.792351477","-122.406151383"]
  end

  def chi_coordinates
    ["41.889714","-87.63719"]
  end

  def sf_instagram_id
    16169461
  end

  def chi_instagram_id
    68855928
  end

  def instagram_resource
    Resource.find_by_user_name_and_source("public", "instagram")
  end

  def caption(obj)
    obj.caption.nil? ? "" : obj.caption.text
  end
  
  def create_instagram_post(obj)
    instagram_resource.posts.create(caption: caption(obj),
      media_type: 'photo',
      posted_at: DateTime.strptime(obj.created_time, '%s'),
      body: obj.user.full_name + " " + obj.user.username + " " + caption(obj),
      url: obj.link,
      data: obj
      )
  end
  
  def dbc_smart_coordinate_search(coordinates_array)
    begin
      Instagram.media_search(coordinates_array[0],coordinates_array[1]).each do |obj|
        puts "Coordinates: #{coordinates_array}"
        puts "Obj: #{obj}"
        unless (obj.tags & coordinate_tags).empty?
          create_instagram_post(obj)
        end
      end

    #5-10% chance of 400 error
    rescue Instagram::BadRequest => e
      Rails.logger.debug e
      Rails.logger.debug "Bad request, retrying..."
      retry
    end
  end

  def dbc_location_search(instagram_location_id)
    Instagram.location_recent_media(instagram_location_id).each do |obj|
      create_instagram_post(obj)
    end
  end

  def tags_search
    tags.each do |tag|
      Instagram.tag_recent_media(tag).each do |obj|
        create_instagram_post(obj)
      end
    end
  end

end
