class TestingController < ApplicationController
  def test
    render :text => params.inspect
  end

  def verification
    params["hub.challenge"]
  end
end
