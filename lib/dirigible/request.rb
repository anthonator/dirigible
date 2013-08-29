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
        request.url("#{endpoint}#{path}", options)
        request.body = options
        request.headers = headers
      end
    end
  end
end
