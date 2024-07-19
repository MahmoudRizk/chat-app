require 'redis'

class ChatSequenceGenerator
  def initialize(application_id)
    @client = RedisClientFactory.get_client
    @application_global_id = application_id
  end

  def get_chat_number
    key = Application.get_redis_key(@application_global_id)
    if @client.exists(key) == 0
      raise "Failed to generate chat number for application: #{@application_global_id}, missing in redis."
    end

    @client.incr(key)
  end
end