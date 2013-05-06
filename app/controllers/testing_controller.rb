class TestingController < ApplicationController
  def test
    params["hub.challenge"], :status=>200
  end

  def verification
    render :text => params.inspect
  end
end
