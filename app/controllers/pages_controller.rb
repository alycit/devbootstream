class PagesController < ApplicationController

  def index
  
    show_filters
    find_posts
    display_params
    render :index
  
  end
    
  def search 
    @page_number = (params[:next_page].to_i || 0 )
    offset = @page_number * 30
    @posts = Post.search(params[:q]).order("posted_at DESC").limit(30).offset(offset)
    render :index
  end

  def show_filters

    @sources = Resource.select(:source).uniq
    @phases = ['Prep', 'Phase 1', 'Phase 2', 'Phase 3', 'Phase 4', 'Alumni']
    
    cohorts = Cohort.select(:name).uniq
    @cohorts = cohorts.sort_by { |cohort| cohort.name }
    
    @num_filters = @sources.length + @phases.length + @cohorts.length
    # @locations = ['San Franciso', 'Chicago']

  end

  def find_posts

    filter_params = params

    filter_params.delete_if {|key, value| key == "controller" || key == "action" ||key == "next_page" }
    Hash[ filter_params.map{ |(k,v)| [k.to_sym,v] } ]

    @page_number = (params[:next_page].to_i || 0 )
    offset = @page_number * 30
    
    @posts = Post.all(
      :order => "posted_at desc", 
      :limit => 30, 
      :conditions => filter_params,
      :offset => offset
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
    show_filters
    @page_number = (params[:next_page].to_i || 0 )
    offset = @page_number * 30
    @posts = Post.search(body: params[:q]).order("posted_at DESC").offset(offset).limit(30)
    render :index
  end

  def about
    render 'about', :layout => false
  end

end
