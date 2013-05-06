class SubscriptionsController < ApplicationController
  def create
    InstagramApi.tags_search
  end

  def new
    if params["hub.challenge"]
      render :text => params["hub.challenge"]
    else
      render_404 and return
    end
  end
end
