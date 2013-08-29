module Dirigible
  # @private
  module Utils
    def self.handle_api_error(response)
      error = case response.status
      when 400 then BadRequest.new
      when 401 then Unauthorized.new
      when 404 then NotFound.new
      when 405 then MethodNotAllowed.new
      else Error.new
      end
      error.error = parse_json(response.body)
      raise error
    end

    def self.parse_json(json)
      MultiJson.load(json, symbolize_keys: true)
    end
  end
end
