class TestingController < ApplicationController
  def test
    params["hub.challenge"]
  end

  def verification
    render :text => params.inspect
  end
end
