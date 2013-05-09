class PagesController < ApplicationController

  def index
  
    show_filters
    find_posts
    display_params
    render :index
  
  end

  def find_posts

    params.delete_if {|key, value| key == "controller" || key == "action" }
    Hash[ params.map{ |(k,v)| [k.to_sym,v] } ]

    conditions = params

    @posts = Post.all(
      :order => "created_at desc", 
      :limit => 50, 
      :conditions => conditions
      )
  
  end

  def display_params

    @source = params[:source]
    
    if params[:phase_id]
      @phase = @phases[params[:phase_id].to_i]
    end
    
    @cohort = params[:cohort]

  end

  def list_phases
    @phases = ['Prep', 'Phase 1', 'Phase 2', 'Phase 3', 'Phase 4', 'Alumni']
  end

  def show_filters

    @sources = Resource.select(:source).uniq

    list_phases

    cohorts = Post.select(:cohort).uniq
    cohort_names = cohorts.pluck("cohort")
    @cohorts = cohort_names.delete_if {|name| name == nil}
    @cohorts = @cohorts.sort

  end
  
  def search
    @posts = Post.search(params[:q]).limit(10)
    render :index
  end

end