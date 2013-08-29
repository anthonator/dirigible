class Dirigible::Schedule
  # Scheduled notifications are created by POSTing to the
  # schedule URI. The body of the request must be one of:
  #
  # * A single a [schedule object](http://docs.urbanairship.com/reference/api/v3/schedule.html#schedule-object).
  # * An array of one or more [schedule objects](http://docs.urbanairship.com/reference/api/v3/schedule.html#schedule-object).
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#schedule-a-notification
  def self.create(params)
    Dirigible.post('/schedules', params)
  end

  # List all existing schedules. Returns an array of schedule
  # objects in the "schedules" attribute.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#list-schedules
  def self.list
    Dirigible.get('/schedules')
  end

  # Fetch the current definition of a single schedule
  # resource. Returns a single schedule object.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#list-a-specific-schedule
  def self.get(id)
    Dirigible.get("/schedules/#{id}")
  end

  # Update the state of a single schedule resource. The body
  # must contain a single schedule object.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#update-schedule
  def self.update(id, params)
    Dirigible.put("/schedules/#{id}", params)
  end

  # Delete a schedule resource, which will result in no more
  # pushes being sent. If the resource is succesfully
  # deleted, the response does not include a body.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/schedule.html#delete-schedule
  def self.delete(id)
    Dirigible.delete("/schedules/#{id}")
  end
end
