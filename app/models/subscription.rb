class Subscription
  def self.update(params)
    @id = params["_json"][0]["subscription_id"]
    case @id
    when 3160806
      InstagramApi.tags_search
    when 3160747
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.sf_coordinates)
    when 3160749
      InstagramApi.dbc_location_search(InstagramApi.sf_instagram_id)
    when 3160748
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.chi_coordinates) 
    when 3160750
      InstagramApi.dbc_location_search(InstagramApi.chi_instagram_id)
    end
  end
end
