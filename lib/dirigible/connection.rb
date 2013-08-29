module Dirigible
  # @private
  module Connection
    private
    def connection
      options = { ssl: { verify: true }, proxy: proxy }
      Faraday.new(endpoint, options) do |faraday|
        faraday.request(:json)
        faraday.basic_auth(app_key, master_secret)
        faraday.adapter(http_adapter)
      end
    end
  end
end
