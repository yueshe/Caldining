Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"] }
end unless ENV['REDIS_URL'].blank?

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_URL"] }
end unless ENV['REDIS_URL'].blank?