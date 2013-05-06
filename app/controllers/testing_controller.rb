class TestingController < ApplicationController
  def test
    render :text => params["hub.challenge"], :status=>200
  end

  def verification
    render :text => params.inspect
  end
end
