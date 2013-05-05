require 'textacular/searchable'
class Post < ActiveRecord::Base
  extend Searchable(:title, :body)
  
  belongs_to :resource
  serialize :data, JSON
  attr_accessible :body, :media_type, :posted_at, :title, :url, :data, :caption, :instagram_poster

  validates :posted_at, 
    :uniqueness=>{:scope=>:resource_id}

  validates :media_type, 
    :resource_id, 
    :posted_at, :presence=>true

  alias_attribute :caption, :title
end
