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
  #   response = Dirigible::DeviceInformation.list_device_tokens(:limit => 5)
  #   response = Dirigible::DeviceInformation.list_device_tokens(response) if response.has_key?(:next_page)
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_device_tokens(options = {})
    list_devices('/device_tokens', options)
  end

  # Fetch Android APIDs registered to this application and
  # associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_apids
  #   response = Dirigible::DeviceInformation.list_apids(:limit => 5)
  #   response = Dirigible::DeviceInformation.list_apids(response) if response.has_key?(:next_page)
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_apids(options = {})
    list_devices('/apids', options)
  end

  # Fetch BlackBerry PINs registered to this application and
  # associated metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.list_device_pins
  #   response = Dirigible::DeviceInformation.list_device_pins(:limit => 5)
  #   response = Dirigible::DeviceInformation.list_device_pins(response) if response.has_key?(:next_page)
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#device-listing
  def self.list_device_pins(options = {})
    list_devices('/device_pins', options)
  end

  # Fetch device tokens that can't recieve messages because
  # the app has been uninstalled.
  #
  # @example Example request:
  #   Dirigible::DeviceInformation.device_token_feedback(Date.yesterday)
  #
  # @see http://docs.urbanairship.com/reference/api/v3/device_information.html#feedback
  def self.device_token_feedback(since)
    Dirigible.get("/device_tokens/feedback", { since: since })
  end

  private
  def self.list_devices(path, options = {})
    merge_start_limit(Dirigible.get(path, options.slice(:start, :limit)))
  end

  def self.merge_start_limit(response)
    return response unless response.is_a?(Hash) && response.has_key?(:next_page)

    next_page = response[:next_page] || ''
    query_string_params = next_page.split('?').last

    params_hash = Rack::Utils.parse_nested_query(query_string_params).symbolize_keys!

    response.merge(params_hash.slice(:start, :limit))
  end

end
