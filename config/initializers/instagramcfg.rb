require_relative '../../lib/InstagramApi'

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
end

$api_calls = 0
