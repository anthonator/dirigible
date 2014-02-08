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

  # Fetch iOS device tokens registered to this application
  # and associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_device_tokens
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_device_tokens(params = {})
    List.new(Dirigible.get('/device_tokens', params))
  end

  # Fetch Android APIDs registered to this application and
  # associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_apids
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_apids(params = {})
    List.new(Dirigible.get('/apids', params))
  end

  # Fetch BlackBerry PINs registered to this application and
  # associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_device_pins
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_device_pins(params = {})
    List.new(Dirigible.get('/device_pins', params))
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
    def next_page(params = {})
      return nil if @response[:next_page].nil?
      uri = URI.parse(@response[:next_page])
      path = "/#{uri.path.gsub(/\/api|\//, '')}"
      # Shew! Need to simplify this!
      params = (CGI.parse(uri.query).map{ |k,v| { k => v[0] } }.reduce({}) { |h,pairs| pairs.each { |k,v| (h[k.to_sym] = v) }; h }).merge!(params)
      List.new(Dirigible.get(path, params))
    end
  end
end
