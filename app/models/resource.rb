class Resource < ActiveRecord::Base
  attr_accessible :entry
  has_many :posts
end
