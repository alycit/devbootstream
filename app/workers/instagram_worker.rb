require_relative "../../lib/InstagramApi"

class InstagramWorker
  include Sidekiq::Worker
  include InstagramApi
  sidekiq_options :retry => false

  def perform
    InstagramApi.get_instagrams
  end
end
