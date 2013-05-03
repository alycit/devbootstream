class Post < ActiveRecord::Base
  belongs_to :resource
  serialize :data, JSON
  attr_accessible :body, :media_type, :posted_at, :title, :url, :data, :caption

  alias_attribute :caption, :title
end
