class Resource < ActiveRecord::Base

  belongs_to :boot
  has_many :posts

  attr_accessible :identifier, :identifier_id, :profile_pic_url, :source, :user_name

  scope :tumblr, where(:source => "tumblr")
  scope :twitter, where(:source => "twitter")
  scope :instagram, where(:source => "instagram")
  validates :source, :presence=>true

  before_create :valid_account?, :if => :twitter?
  after_create :create_identifier_id, :if => :twitter?

  def twitter?
    source == 'twitter'
  end

  def valid_account?
    user_matches = Twitter.user_search(self.identifier)
    
    if user_matches.empty?
      return false
    else
      user_matches.each do |user|
        if self.identifier.downcase == user.user_name.downcase && !user.protected 
          return true 
        else 
          return false
        end
      end
    end
  end

  def create_identifier_id
    self.update_attributes(identifier_id: Twitter.user(self.identifier).id)
  end

  def oldest_tweet_id
    unless self.posts.empty?
      self.posts.pluck(:url).map { |f| f.match(/(status\/)(.+)/)[2].to_i }.min
    else
      sleep(5)
      x = Twitter.user_timeline(self.identifier).first
      unless x.nil?
        x.user.status.id
      end
    end
  end

  # Deprecated if using TweetStream
  # def newest_tweet_id
  #   self.posts.pluck(:url).map { |f| f.match(/(status\/)(.+)/)[2].to_i }.max
  # end
end
