module Dirigible
  # @private
  module Connection
    private
    def connection
      options = { ssl: { verify: true } }
      Faraday.new(endpoint, options) do |faraday|
        faraday.request(:json)
      end
    end
  end
end
