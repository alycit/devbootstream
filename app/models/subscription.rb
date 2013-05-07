class Subscription
  def self.update(params)
    @id = params["_json"][0]["subscription_id"]
    case @id
    when 3160806
      puts "TAG SEARCHINGGGGGGGGGGGGGGGGG"
      InstagramApi.tags_search
    when 3160747 #SF coordinate match
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.sf_coordinates)
      puts "COOOOOOOOOOOOOOOOORDINATE SFFFFF"  
    when 3160749 #SF id match
      InstagramApi.dbc_location_search(InstagramApi.sf_instagram_id)
      puts "LOCATION_IDDDDDDDDDDDDDDDDD    SFFFFFF"
    when 3160748
      InstagramApi.dbc_smart_coordinate_search(InstagramApi.chi_coordinates)
      puts "COOOOOOOOOOOOOOOOORDINATE chi"  
    when 3160750
      InstagramApi.dbc_location_search(InstagramApi.chi_instagram_id)
      puts "LOCATION_IDDDDDDDDDDDDDDDDD    CHIIIIIIII"
    else
      puts "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    end
  end
end

