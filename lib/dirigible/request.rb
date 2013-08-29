module Dirigible
  module Request
    def get(path, options = {}, headers = {})
      request(:get, path, options, headers)
    end

    def post(path, options = {}, headers = {})
      request(:post, path, options, headers)
    end

    def put(path, options = {}, headers = {})
      request(:put, path, options, headers)
    end

    def delete(path, options = {}, headers = {})
      request(:delete, path, options, headers)
    end

    private
    # Perform an HTTP request.
    def request(method, path, options, headers)
      headers.merge!({
        'User-Agent' => user_agent,
        'Accept' => 'application/vnd.urbanairship+json; version=3;',
      })

      response = connection.send(method) do |request|
        request.url("#{endpoint}#{path}/")
        request.body = options.to_json
        request.headers.merge!(headers)
      end

      Utils.handle_api_error(response) unless (200..399).include?(response.status)

      Utils.parse_json(response.body) unless response.body == ''
    end
  end
end
