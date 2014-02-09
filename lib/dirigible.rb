require 'faraday'
require 'faraday_middleware'
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
require 'dirigible/tag'
require 'dirigible/feed'
require 'dirigible/device_information'
require 'dirigible/device_registration'
require 'dirigible/segment'
require 'dirigible/location'

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
