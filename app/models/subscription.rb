class Subscription
  def self.update(params)
    @id = params["_json"][0]["subscription_id"]
    case @id
    when 3169985
      InstagramApi.tags_search
    when 3169989
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.sf_coordinates)
    when 3169992
      InstagramApi.dbc_location_search(InstagramApi.sf_instagram_id)
    when 3169990
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.chi_coordinates) 
    when 3169993
      InstagramApi.dbc_location_search(InstagramApi.chi_instagram_id)
    end
  end
end
