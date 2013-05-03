namespace :sidekiq do
  desc "tumblr test"
  task :start do 
    TumblrWorker.perform_async
  end
end
