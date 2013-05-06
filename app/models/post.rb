require 'textacular/searchable'
class Post < ActiveRecord::Base
  extend Searchable(:title, :body)
  before_create :add_phase_stamp

  belongs_to :resource
  serialize :data, JSON
  attr_accessible :body, :media_type, :posted_at, :title, :url, :data, :caption, :instagram_poster

  validates :posted_at, 
    :uniqueness=>{:scope=>:resource_id}

  validates :media_type, 
    :resource_id, 
    :posted_at, :presence=>true

  alias_attribute :caption, :title

  def add_phase_stamp
    if boot = resource.boot
      self.phase_id = boot.current_phase(self.posted_at)
    end
  end
end
