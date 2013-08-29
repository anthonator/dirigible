class Dirigible::Push < Dirigible::Endpoint
  # Send a push notification to a specified device or list
  # of devices. Must be one of:
  #
  # * A single [Push Object](http://docs.urbanairship.com/reference/api/v3/push.html#push-object)
  # * An array of one or more [Push Objects](http://docs.urbanairship.com/reference/api/v3/push.html#push-object)
  #
  # @see http://docs.urbanairship.com/reference/api/v3/push.html#push
  def self.create(params)
    new(Dirigible.post('/push', params))
  end

  # Accept the same range of payloads as /api/push, but parse
  # and validate only, without sending any pushes.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/push.html#validate
  def self.validate(params)
    new(Dirigible.post('/push/validate'))
  end
end
