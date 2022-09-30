require "redis"

class ConnectionRedis
  @instance = new
  private_class_method :new
  
  def self.instance
    @redis ||= Redis.new(host: "redis", port: 6379, db: 15)
  end
end

# instance = ConnectionRedis.instance
# instance.set('mykey', 'Hello World from Redis !')
# puts instance.get('mykey')
