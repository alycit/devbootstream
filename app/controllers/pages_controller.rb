class PagesController < ApplicationController

  def index
  	show_filters
  	apply_filters
  end
    
  def search
    @posts = Post.basic_search(body: params[:q]).limit(10)
    render :index
  end

  def show_filters

    @sources = Resource.select(:source).uniq
    @phases = ['Prep', 'Phase 1', 'Phase 2', 'Phase 3', 'Phase 4', 'Alumni']
    @cohorts = Cohort.all
    @locations = ['San Franciso', 'Chicago']

  end

  def apply_filters

    @params = params

    @source = params[:source]

    @posts = Post.order.joins(:resource).where(resources: {source: @source}).order("posted_at DESC").limit(50)

  end

end






