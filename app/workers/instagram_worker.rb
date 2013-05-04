require_relative "../../lib/InstagramAPI"

class InstagramWorker
  include Sidekiq::Worker
  include InstagramAPI
  sidekiq_options :retry => false

  def perform
    InstagramAPI.get_instagrams
  end
end
