class Dirigible::DeviceRegistration
  # Register the device token with this application. This
  # will mark the device token as active in our system.
  # Optionally set metadata.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#device-token-registration
  def self.register_device_token(id, params)
    Dirigible.put("/device_tokens/#{id}", params)
  end

  # Deactivate the device token and clear metadata. Pushes
  # will not be sent to inactive device tokens. A future
  # registration will reactivate the device token.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#device-token-registration
  def self.delete_device_token(id)
    Dirigible.delete("/device_tokens/#{id}")
  end

  # Register the APID and options with Urban Airship
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#apid-registration
  def self.register_apid(id, params)
    Dirigible.put("/apids/#{id}", params)
  end

  # Register this PIN with this application. This will mark
  # the PIN as active in our system. Optionally set metadata.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#blackberry-pin-registration
  def self.register_device_pin(id, params)
    Dirigible.put("/device_pins/#{id}", params)
  end

  # Deactivate the PIN and clear metadata. Pushes will not
  # be sent to inactive PINs. A future registration will
  # reactivate the PIN.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#blackberry-pin-registration
  def self.delete_device_pin(id)
    Dirigible.delete("/device_pins/#{id}")
  end
end
