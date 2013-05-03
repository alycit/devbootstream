class Post < ActiveRecord::Base
  belongs_to :resource

  attr_accessible :body, :media_type, :posted_at, :title, :url, :caption

  alias_attribute :caption, :title
end
