module RedisMasterSlave
  #
  # Using Redis::Store instead of Redis
  #
  class StoreClient < Client
    private
    def make_client(config)
      case config
      when String
        Redis::Store.new(url: config)
      else
        super
      end
    end
  end
end
