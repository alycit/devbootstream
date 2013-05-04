require_relative "../../lib/InstagramApi"

class InstagramWorker
  include Sidekiq::Worker
  include InstagramAPI
  sidekiq_options :retry => false

  def perform
    InstagramAPI.get_instagrams
  end
end
