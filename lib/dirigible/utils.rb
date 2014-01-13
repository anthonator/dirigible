module Dirigible
  # @private
  module Utils
    def self.handle_api_error(response)
      message = parse_message(response)

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

    def self.parse_message(response)
      #UA docs/behaviour doesn't seem consistent enough to help us here.
      #the headers can lie, and this was a verified bug.
      #just try to treat body as JSON and if that fails, return body
      begin
        parse_json(response.body)
      rescue
        response.body
      end
    end
  end
end
