class SubscriptionsController < ApplicationController
  def create
    Subscription.update(params)
    render :nothing => true
  end

  def new
    if params["hub.challenge"]
      render :text => params["hub.challenge"]
    else
      render_404 and return
    end
  end
end
