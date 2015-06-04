# @see http://docs.urbanairship.com/reference/api/v3/push.html
class Dirigible::Push
  # Send a push notification to a specified device or list
  # of devices. Must be one of:
  #
  # * A single {http://docs.urbanairship.com/reference/api/v3/push.html#push-object Push Object}
  # * An array of one or more {http://docs.urbanairship.com/reference/api/v3/push.html#push-object Push Object}
  #
  # @example Example request:
  #   Dirigible::Push.create({
  #     audience: { device_token: "998BAD77A8347EFE7920F5367A4811C4385D526AE42C598A629A73B94EEDBAC8" },
  #     notification: { alert: "Hello!" },
  #     device_types: "all"
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/push.html#push
  def self.create(params)
    Dirigible.post('/push/', params)
  end

  # Accept the same range of payloads as /api/push, but parse
  # and validate only, without sending any pushes.
  #
  # @example Missing payload:
  #   Dirigible::Push.validate({
  #     audience: "all",
  #     device_types: ["ios", "android"],
  #     notification: {
  #       ios: { alert: "Boo" }
  #     }
  #   })
  #
  # @example Device identifier/restriction mismatch:
  #   Dirigible::Push.validate({
  #     audience: {
  #       or: [
  #         device_pin: "1fd34210",
  #         device_token: "645A5C6C06AFB2AE095B079135168A04A5F974FBF27163F3EC6FE1F2D5AFE008"
  #       ]
  #     },
  #     device_types: ["blackberry"],
  #     notification: {
  #       alert: "WAT"
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/push.html#validate
  def self.validate(params)
    Dirigible.post('/push/validate', params)
  end
end
