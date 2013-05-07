require_relative "../../lib/InstagramApi"

class InstagramWorker
  include Sidekiq::Worker
  include InstagramApi
  sidekiq_options :retry => false

  ActiveRecord::Base.observers.disable :all

  def perform
    InstagramApi.get_instagrams
  end
end
