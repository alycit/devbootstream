class TestingController < ApplicationController
  def test
    InstagramApi.tag_search
  end

  def verification
    render :text => params["hub.challenge"]
  end
end
