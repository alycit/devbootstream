class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user	

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
