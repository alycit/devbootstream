class TestingController < ApplicationController
  def test
    
  end

  def verification
    # render :text => params["hub.challenge"]
    InstagramApi.tags_search
  end
end
