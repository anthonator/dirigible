require 'faraday'
require 'faraday_middleware'
require 'hashie'
require 'multi_json'

require 'dirigible/version'
require 'dirigible/error'
require 'dirigible/utils'

require 'dirigible/configuration'
require 'dirigible/connection'
require 'dirigible/request'
require 'dirigible/api'

require 'dirigible/push'
require 'dirigible/schedule'

module Dirigible
  extend Configuration

  def self.api(options = {})
    Dirigible::API.new(options)
  end

  def self.method_missing(method, *args, &block)
    return super unless api.respond_to?(method)
    api.send(method, *args, &block)
  end

  def self.respond_to?(method)
    api.respond_to?(method) || super
  end
end
