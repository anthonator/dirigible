class Dirigible::DeviceRegistration
  # Register the device token with this application. This
  # will mark the device token as active in our system.
  # Optionally set metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceRegistration.register_device_token('FE66489F304DC75B8D6E8200DFF8A456E8DAEACEC428B427E9518741C92C6660')
  #
  # @example Full capability:
  #   Dirigible::DeviceRegistration.register_device_token('FE66489F304DC75B8D6E8200DFF8A456E8DAEACEC428B427E9518741C92C6660', {
  #     alias: "your_user_id",
  #     tags: ["tag1", "tag2"],
  #     badge: 2,
  #     quiettime: {
  #       start: "22:00",
  #       end: "8:00"
  #     },
  #     tz: "America/Los_Angeles"
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#device-token-registration
  def self.register_device_token(id, options = {})
    Dirigible.put("/device_tokens/#{id}", options)
  end

  # Deactivate the device token and clear metadata. Pushes
  # will not be sent to inactive device tokens. A future
  # registration will reactivate the device token.
  #
  # @example Example request:
  #   Dirigible::DeviceRegistration.delete_device_token('FE66489F304DC75B8D6E8200DFF8A456E8DAEACEC428B427E9518741C92C6660')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#device-token-registration
  def self.delete_device_token(id)
    Dirigible.delete("/device_tokens/#{id}")
  end

  # Register the APID and options with Urban Airship.
  #
  # @example Example request:
  #   Dirigible::DeviceRegistration.register_apid('11111111-1111-1111-1111-111111111111', {
  #     alias: "example_alias",
  #     tags: ["tag1", "tag2"]
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#apid-registration
  def self.register_apid(id, params)
    Dirigible.put("/apids/#{id}", params)
  end

  # Register this PIN with this application. This will mark
  # the PIN as active in our system. Optionally set metadata.
  #
  # @example Example request:
  #   Dirigible::DeviceRegistration.register_device_pin('12345678')
  #
  # @example Full capability:
  #   Dirigible::DeviceRegistration.register_device_pin('12345678', {
  #     alias: "your_user_id",
  #     tags: ["tag1", "tag2"]
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#blackberry-pin-registration
  def self.register_device_pin(id, options = {})
    Dirigible.put("/device_pins/#{id}", options)
  end

  # Deactivate the PIN and clear metadata. Pushes will not
  # be sent to inactive PINs. A future registration will
  # reactivate the PIN.
  #
  # @example Example request:
  #   Dirigible::DeviceRegistration.delete_device_pin('12345678')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/registration.html#blackberry-pin-registration
  def self.delete_device_pin(id)
    Dirigible.delete("/device_pins/#{id}")
  end
end
