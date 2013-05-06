class Subscription
  def self.update(params)
    @id = params["_json"][0][subscription_id]
    case @id
    when 3160806
      puts "TAG SEARCHINGGGGGGGGGGGGGGGGG"
      InstagramApi.tags_search
    when 3160747
      InstagramApi.dbc_smart_coordinate_search
      puts "COOOOOOOOOOOOOOOOORDINATE"
    when 3160749
      InstagramApi.dbc_location_search
      put "LOCATION_IDDDDDDDDDDDDDDDDD"
    else
      puts "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    end
  end
end

