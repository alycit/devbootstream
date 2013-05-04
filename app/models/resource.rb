class Resource < ActiveRecord::Base

  belongs_to :boot
  has_many :posts
  attr_accessible :identifier, :profile_pic_url, :source, :user_name

  scope :tumblr, where(:source => "tumblr")

  validates :source, :presence=>true
end
