class Dirigible::DeviceInformation
  # Get information on a particular iOS device token. For
  # information on particular keys, see the device token
  # registration API.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.get_device_token('FE66489F304DC75B8D6E8200DFF8A456E8DAEACEC428B427E9518741C92C6660')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#individual-device-lookup
  def self.get_device_token(id)
    Dirigible.get("/device_tokens/#{id}")
  end

  # Get information on a particular Android APID.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.get_apid('11111111-1111-1111-1111-111111111111')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#individual-device-lookup
  def self.get_apid(id)
    Dirigible.get("/apids/#{id}")
  end

  # Get information on a particular BlackBerry PIN.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.get_device_pin('12345678')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#individual-device-lookup
  def self.get_device_pin(id)
    Dirigible.get("/device_pins/#{id}")
  end

  # Count iOS device tokens registered to this application
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.count_device_tokens[:device_tokens_count]
  #   Dirigible::DeviceInformation.count_device_tokens[:active_device_tokens_count]
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.count_device_tokens
    Dirigible.get("/device_tokens/count")
  end


  # Fetch iOS device tokens registered to this application
  # and associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_device_tokens
  #
  # @example Request next page:
  #   response = Dirigible::DeviceInformation.list_device_tokens
  #   device_tokens = response[:device_tokens]
  #   more_device_tokens = response.next_page[:device_tokens]
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_device_tokens(options = {})
    List.new(Dirigible.get('/device_tokens', options))
  end

  # Fetch Android APIDs registered to this application and
  # associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_apids
  #
  # @example Request next page:
  #   response = Dirigible::DeviceInformation.list_apids
  #   apids = response[:apids]
  #   more_apids = response.next_page[:apids]
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_apids(options = {})
    List.new(Dirigible.get('/apids', options))
  end

  # Fetch BlackBerry PINs registered to this application and
  # associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_device_pins
  #
  # @example Request next page:
  #   response = Dirigible::DeviceInformation.list_device_pins
  #   device_pins = response[:device_pins]
  #   more_device_pins = response.next_page[:device_pins]
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_device_pins(options = {})
    List.new(Dirigible.get('/device_pins', options))
  end

  # Fetch device tokens that can't recieve messages because
  # the app has been uninstalled.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.device_token_feedback('2009-06-15')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#feedback
  def self.device_token_feedback(since)
    Dirigible.get("/device_tokens/feedback", { since: since })
  end

  class List
    def initialize(response)
      @response = response
    end

    def [](value)
      @response[value]
    end

    # Fetch the next page for this device listing. Returns
    # nil if next_page is nil.
    def next_page()
      return nil if @response[:next_page].nil?
      uri = URI.parse(@response[:next_page])
      path = "/#{uri.path.gsub('/api/', '')}"

      params = Rack::Utils.parse_nested_query(uri.query).symbolize_keys!

      List.new(Dirigible.get(path, params))
    end
  end
end
