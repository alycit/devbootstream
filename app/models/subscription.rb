class Subscription
  def self.update(params)
    @id = params["_json"][0]["subscription_id"]
    case @id
    when 3161373
      InstagramApi.tags_search
    when 3161374
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.sf_coordinates)
    when 3161377
      InstagramApi.dbc_location_search(InstagramApi.sf_instagram_id)
    when 3161375
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.chi_coordinates) 
    when 3161378
      InstagramApi.dbc_location_search(InstagramApi.chi_instagram_id)
    end
  end
end
