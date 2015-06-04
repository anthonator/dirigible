module Dirigible
  # @private
  module Utils
    def self.handle_api_error(response)


      klass = case response.status
        when 400 then BadRequest
        when 401 then Unauthorized
        when 404 then NotFound
        when 405 then MethodNotAllowed
        when 406 then NotAcceptable
        when 503 then ServiceUnavailable
        else Error
      end

      err = klass.new(response.body)
      err.parsed = parse_message(response)
      raise err

    end

    def self.parse_json(json)
      MultiJson.load(json, symbolize_keys: true)
    end

    def self.parse_message(response)

      begin
        parse_json(response.body)
      rescue
        response.body
      end
    end
  end
end
