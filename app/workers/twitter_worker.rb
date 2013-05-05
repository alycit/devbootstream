require_relative "../../lib/TwitterApi"

class TwitterWorker
  include Sidekiq::Worker
  include TwitterApi
  sidekiq_options :retry => false

  def perform
    #TBD 
  end
end
