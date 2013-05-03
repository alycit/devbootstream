CALLBACK_URL = "http://localhost:9393/oauth/callback"

access_token = "357627834.3bdcc20.299991d0a5b24034bae7bc68f189e6a0"

require 'instagram'
Instagram.configure do |config|
  config.client_id = "3bdcc204c16b4beea31ae981d9fefbab"
  config.client_secret = "98aaf7f9d3d2472ebe18a1bc553f116f"
end

client = Instagram.client(:access_token => access_token)

