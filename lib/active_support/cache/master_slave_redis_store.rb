module ActiveSupport::Cache
  #
  # ActiveSupport::Cache Store Class
  #
  # * application.rb
  #
  #   class Application < Rails::Application
  #     config.cache_store = ActiveSupport::Cache::MasterSlaveRedisStore.new 'redis://localhost:6379'
  #   end
  #
  #
  # * Structure of Rails.cache
  #
  #   Rails.cache (ActiveSupport::Cache::MasterSlaveRedisStore)
  #     .data (RedisMasterSlave::StoreClient)
  #       .master (Redis::Store)
  #       .slaves ([Redis::Store, ...])
  #
  #
  class MasterSlaveRedisStore < RedisStore
    def initialize(*addresses)
      @options = addresses.extract_options! # Set @options of ActiveSupport::Cache::Store

      @data = RedisMasterSlave::StoreClient.new(*addresses)
    end
  end if defined? RedisStore
end
