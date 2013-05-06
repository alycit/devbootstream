class TestingController < ApplicationController
  def test
    render :text => params.inspect
  end

  def verification
    render :text => params["hub.challenge"]
  end
end
