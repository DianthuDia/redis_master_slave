require 'redis'

module RedisMasterSlave
  autoload :Client, 'redis_master_slave/client'
  autoload :StoreClient, 'redis_master_slave/store_client'
  autoload :ReadOnly, 'redis_master_slave/read_only'
  autoload :ReadOnlyError, 'redis_master_slave/read_only'

  #
  # Create a new client. Same as Client.new.
  #
  def self.new(*args, &block)
    Client.new(*args, &block)
  end
end

if defined?(ActiveSupport::Cache)
  module ActiveSupport::Cache
    autoload :MasterSlaveRedisStore, 'active_support/cache/master_slave_redis_store'
  end
end
