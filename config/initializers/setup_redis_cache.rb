def flush_chat_counts_from_redis_to_db(redis)
  applications = Application.all
  applications.each do |app|
    key = Application.get_redis_key(app.uuid)
    if redis.exists(key) != 0
      app.chats_count = redis.get(key)
      app.save

      redis.del(key)
    end
  end
end

def set_chat_counts_from_db_to_redis(redis)
  applications = Application.all
  applications.each do |app|
    key = Application.get_redis_key(app.uuid)
    redis.set(key, app.chats_count)
  end

end

def initialize_redis_cache
  redis_client = RedisClientFactory.get_client
  flush_chat_counts_from_redis_to_db(redis_client)
  set_chat_counts_from_db_to_redis(redis_client)
end

Rails.application.config.after_initialize do
  begin
    initialize_redis_cache
  rescue ActiveRecord::NoDatabaseError
    puts "Skipping redis cache configuration, because Database is not reachable."
  rescue ActiveRecord::StatementInvalid
    puts "Skipping redis cache configuration, because tables are not created yet."
  end
end