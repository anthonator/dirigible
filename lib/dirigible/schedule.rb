# @see http://docs.urbanairship.com/reference/api/v3/schedule.html
class Dirigible::Schedule
  # Scheduled notifications are created by POSTing to the
  # schedule URI. The body of the request must be one of:
  #
  # * A single {http://docs.urbanairship.com/reference/api/v3/schedule.html#schedule-object schedule object}.
  # * An array of one or more {http://docs.urbanairship.com/reference/api/v3/schedule.html#schedule-object schedule objects}.
  #
  # @example Example request:
  #   Dirigible::Schedule.create({
  #     name: "Booyah Sports",
  #     schedule: { scheduled_time: "2013-04-01T18:45:00" },
  #     push: {
  #       audience: { tag: "spoaaaarts" },
  #       notification: { alert: "Booyah!" },
  #       device_types: "all"
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#schedule-a-notification
  def self.create(params)
    Dirigible.post('/schedules/', params)
  end

  # List all existing schedules. Returns an array of schedule
  # objects in the "schedules" attribute.
  #
  # @example Example request:
  #   Dirigible::Schedule.list
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#list-schedules
  def self.list
    Dirigible.get('/schedules/')
  end

  # Fetch the current definition of a single schedule
  # resource. Returns a single schedule object.
  #
  # @example Example request:
  #   Dirigible::Schedule.get('5cde3564-ead8-9743-63af-821e12337812')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#list-a-specific-schedule
  def self.get(id)
    Dirigible.get("/schedules/#{id}")
  end

  # Update the state of a single schedule resource. The body
  # must contain a single schedule object.
  #
  # @example Example request:
  #   Dirigible::Schedule.update('5cde3564-ead8-9743-63af-821e12337812', {
  #     name: "Booyah Sports",
  #     schedule: { scheduled_time: "2013-04-01T18:45:30" },
  #     push: {
  #       audience: { tag: ["spoaaaarts", "Beyonce", "Nickelback"] },
  #       notification: { alert: "Booyah!" },
  #       device_types: "all"
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#update-schedule
  def self.update(id, params)
    Dirigible.put("/schedules/#{id}", params)
  end

  # Delete a schedule resource, which will result in no more
  # pushes being sent. If the resource is succesfully
  # deleted, the response does not include a body.
  #
  # @example Example request:
  #   Dirigible::Schedule.delete('b384ca54-0a1d-9cb3-2dfd-ae5964630e66')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#delete-schedule
  def self.delete(id)
    Dirigible.delete("/schedules/#{id}")
  end
end
