require 'redis'

class ChatSequenceGenerator
  def initialize(application_id)
    @client = RedisClientFactory.get_client
    @application_global_id = application_id
  end

  def get_chat_number
    key = Application.get_redis_key(@application_global_id)
    @client.incr(key)
  end
end