class TestingController < ApplicationController
  def test
    render :text => params.inspect
  end
end
