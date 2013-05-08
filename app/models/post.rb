require 'textacular/searchable'
class Post < ActiveRecord::Base
  extend Searchable(:title, :body, :phase_id, :cohort, :source)
  before_create :add_phase_stamp
  
  after_create :add_cohort, :add_source
  after_create :update_twitter_profile_pic, :if => :twitter?

  belongs_to :resource
  
  serialize :data, JSON
  attr_accessible :body, :media_type, :posted_at, :title, :url, :data, :caption

  validates :posted_at, 
  :uniqueness=>{:scope=>:resource_id}

  validates :media_type, 
  :resource_id, 
  :posted_at, :presence=>true

  alias_attribute :caption, :title


  scope :tumblr, where(:resource_id => Resource.tumblr)
  scope :twitter, where(:resource_id => Resource.twitter)


  def twitter?
    self.resource.source == "twitter"
  end

  def update_twitter_profile_pic
    if resource.profile_pic_url == data["user"]["profile_image_url"]
      return
    else
      resource.update_attributes(:profile_pic_url => data["user"]["profile_image_url"])
    end
  end

  def add_phase_stamp
    if boot = resource.boot
      self.phase_id = boot.current_phase(self.posted_at)
    end
  end

  def add_cohort
    if self.resource.boot
      cohort_name = self.resource.boot.cohort.name
      self.cohort = cohort_name
      self.save
    end
  end

  def add_source
    if self.resource.source
      source_name = self.resource.source
      self.source = source_name
      self.save
    end
  end

end
