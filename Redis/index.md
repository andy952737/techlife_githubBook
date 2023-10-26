gem 'redis'

# config/environments/development.rb, add:
# config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }

# config/initializers/session_store.rb, add:
# Rails.application.config.session_store :redis_store, servers: "redis://localhost:6379/0/session"

gem 'sidekiq'
# config/initializers/sidekiq.rb, add: 
```
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

```

# redis-server start 
