require 'redis'

class MessageSequenceGenerator
  def initialize(application_id, chat_number)
    @client = RedisClientFactory.get_client
    @application_global_id = application_id
    @chat_number = chat_number
  end

  def get_message_number
    key = Chat.get_redis_key(@application_global_id, @chat_number)
    @client.incr(key)
  end
end