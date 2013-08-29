module Dirigible
  # @private
  class API
    attr_accessor *Configuration::VALID_OPTION_KEYS

    def initialize(options = {})
      options = Dirigible.options.merge(options)
      Configuration::VALID_OPTION_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
  end
end
