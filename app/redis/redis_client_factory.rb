class RedisClientFactory
  def self.get_client(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'], db: Rails.env.test? ? 1 : 0)
    Redis.new(host: host, port: port, db: db)
  end
end