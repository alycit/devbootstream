class Resource < ActiveRecord::Base

  belongs_to :boot
  has_many :posts
  attr_accessible :identifier, :profile_pic_url, :source, :user_name

  scope :tumblr, where(:source => "tumblr")
  scope :twitter, where(:source => 'twitter')
  validates :source, :presence=>true

  before_create do |resource|
    resource.source == 'twitter' ? valid_account? : true
  end


  def valid_account?
    user_matches = Twitter.user_search(self.identifier)
    if user_matches.empty?
      return false
    else
      user_matches.each do |user|
        self.identifier.downcase == user.user_name.downcase && !user.protected ? true : false
      end
    end
  end

  def oldest_tweet_id
    unless self.posts.empty?
      self.posts.pluck(:url).map { |f| f.match(/(status\/)(.+)/)[2].to_i }.min
    else
      Twitter.user_timeline(self.identifier).first.user.status.id
    end
  end

  def newest_tweet_id
    self.posts.pluck(:url).map { |f| f.match(/(status\/)(.+)/)[2].to_i }.max
  end
end
