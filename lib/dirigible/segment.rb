# @see http://docs.urbanairship.com/reference/api/v3/segments.html
class Dirigible::Segment
  # List all of the segments for the application.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segments-information
  def self.list
    Dirigible.get('/segments')
  end

  # Fetch information about a particular segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segments-information
  def self.get(id)
    Dirigible.get("/segments/#{id}")
  end

  # Create a new segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def self.create(params)
    Dirigible.post('/segments', params)
  end

  # Change the definition of the segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def self.update(id, params)
    Dirigible.put("/segments/#{id}", params)
  end

  # Remove the segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def self.delete(id)
    Dirigible.delete("/segments/#{id}")
  end
end
