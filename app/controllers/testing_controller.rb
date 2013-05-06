class TestingController < ApplicationController
  def test
    InstagramApi.tags_search
  end

  def verification
    render :text => params["hub.challenge"]
  end
end
