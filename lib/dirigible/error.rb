module Dirigible
  # Custom error class for rescuing from all known Urban Airship errors
  class Error < StandardError; attr_accessor :error end

  # Raised when Urban Airship returns HTTP status code 400
  class BadRequest < Error; end

  # Raised when Urban Airship returns HTTP status code 401
  class Unauthorized < Error; end

  # Raised when Urban Airship returns HTTP status code 404
  class NotFound < Error; end

  # Raised when Urban Airship returns HTTP status code 405
  class MethodNotAllowed < Error; end
end
