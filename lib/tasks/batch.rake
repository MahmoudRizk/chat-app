namespace :batch do
  desc "Sync Chats & Messages count from redis to MySQL"
  task sync_counts_from_redis: :environment do
    redis_client = RedisClientFactory.get_client

    flush_chat_counts_from_redis_to_db(redis_client, false)
    flush_message_counts_from_redis_to_db(redis_client, false)

  end

end
