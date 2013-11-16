module Dirigible
  # @private
  module Utils
    def self.handle_api_error(response)
      message = parse_json(response.body)

      klass = case response.status
        when 400 then BadRequest
        when 401 then Unauthorized
        when 404 then NotFound
        when 405 then MethodNotAllowed
        when 406 then NotAcceptable
        else Error
      end

      raise klass.new(message)
    end

    def self.parse_json(json)
      MultiJson.load(json, symbolize_keys: true)
    end
  end
end
