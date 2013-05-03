class Post < ActiveRecord::Base
  attr_accessible :blob#, :body
  belongs_to :resource
end
