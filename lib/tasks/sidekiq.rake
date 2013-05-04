namespace :sidekiq do
  desc "tumblr task"
  task :start do 
    TumblrWorker.perform_async
  end
end
