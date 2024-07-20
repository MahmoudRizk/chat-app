def flush_chat_counts_from_redis_to_db(redis, delete_keys=true)
  puts "Flushing Chats count from redis to db"
  applications = Application.all
  applications.each do |app|
    key = Application.get_redis_key(app.uuid)
    if redis.exists(key) != 0
      app.chats_count = redis.get(key)
      app.save

      if delete_keys
        redis.del(key)
      end

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

def flush_message_counts_from_redis_to_db(redis, delete_keys=true)
  puts "Flushing Messages count from redis to db"
  chats = Chat.all
  chats.each do |chat|
    key = Chat.get_redis_key(chat.application.uuid, chat.chat_number)
    if redis.exists(key) != 0
      chat.messages_count = redis.get(key)
      chat.save

      if delete_keys
        redis.del(key)
      end

    end
  end

end

def flush_message_counts_from_db_to_redis(redis)
  chats = Chat.all
  chats.each do |chat|
    key = Chat.get_redis_key(chat.application.uuid, chat.chat_number)
    redis.set(key, chat.messages_count)
  end

end

def initialize_redis_cache
  redis_client = RedisClientFactory.get_client

  flush_chat_counts_from_redis_to_db(redis_client)
  set_chat_counts_from_db_to_redis(redis_client)

  flush_message_counts_from_redis_to_db(redis_client)
  flush_message_counts_from_db_to_redis(redis_client)
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