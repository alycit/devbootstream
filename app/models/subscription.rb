class Subscription
  #Instagram Subscription ID's
  DEVBOOTCAMP_TAG = 3169985
  DBC_SF_COOR = 3169989
  DBC_CHI_COOR = 3169990
  DBC_SF_LOCATION = 3169992
  DBC_CHI_LOCATION = 3169993

  def self.update(params)
    @id = params["_json"][0]["subscription_id"]
    case @id
    when DEVBOOTCAMP_TAG
      InstagramApi.tags_search
    when DBC_SF_COOR
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.sf_coordinates)
    when DBC_SF_LOCATION
      InstagramApi.dbc_location_search(InstagramApi.sf_instagram_id)
    when DBC_CHI_COOR
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.chi_coordinates) 
    when DBC_CHI_LOCATION
      InstagramApi.dbc_location_search(InstagramApi.chi_instagram_id)
    end
  end
end
