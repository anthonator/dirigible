require 'faraday'
require 'hashie'
require 'multi_json'

require 'dirigible/version'

require 'dirigible/configuration'
require 'dirigible/connection'
require 'dirigible/request'

module Dirigible
  extend Configuration
end
