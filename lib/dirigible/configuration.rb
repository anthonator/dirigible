module Dirigible
  module Configuration
    VALID_OPTION_KEYS = [
      :app_key,
      :master_key,
      :endpoint,
      :http_adapter,
      :proxy,
      :user_agent
    ]

    # By default, don't set app key.
    DEFAULT_APP_KEY = nil.freeze

    # By default, don't set the master key.
    DEFAULT_MASTER_KEY = nil.freeze

    # The endpoint that will be used to authorize a user if none is set.
    DEFAULT_ENDPOINT = 'https://go.urbanairship.com'.freeze

    # The Faraday HTTP adapter to be used.
    DEFAULT_HTTP_ADAPTER = Faraday.default_adapter

    # By default, don't set a proxy server.
    DEFAULT_PROXY = nil.freeze

    # The user agent that will be sent to the API endpoint if none is set.
    DEFAULT_USER_AGENT = "dirigible gem v#{Dirigible::VERSION}"

    # @private
    attr_accessor(*VALID_OPTION_KEYS)

    # When this module is extended, set all configuration options to their
    # default values.
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a
    # block.
    def configure
      yield self
    end

    # Create a hash of options and their values.
    def options
      VALID_OPTION_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to default.
    def reset
      self.app_key = DEFAULT_APP_KEY
      self.master_key = DEFAULT_MASTER_KEY
      self.endpoint = DEFAULT_ENDPOINT
      self.http_adapter = DEFAULT_HTTP_ADAPTER
      self.proxy = DEFAULT_PROXY
      self.user_agent = DEFAULT_USER_AGENT
    end
  end
end
