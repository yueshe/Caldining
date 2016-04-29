Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://h:p6tp08q5hpg1og9tl2hd57ehh9f@ec2-54-227-251-101.compute-1.amazonaws.com:13429' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://h:p6tp08q5hpg1og9tl2hd57ehh9f@ec2-54-227-251-101.compute-1.amazonaws.com:13429' }
end
