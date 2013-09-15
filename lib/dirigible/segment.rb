# @see http://docs.urbanairship.com/reference/api/v3/segments.html
class Dirigible::Segment
  # List all of the segments for the application.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segments-information
  def list
    Dirigible.get('/segments')
  end

  # Fetch information about a particular segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segments-information
  def get(id)
    Dirigible.get("/segments/#{id}")
  end

  # Create a new segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def create(params)
    Dirigible.post('/segments', params)
  end

  # Change the definition of the segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def update(id, params)
    Dirigible.put("/segments/#{id}", params)
  end

  # Remove the segment.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def delete(id)
    Dirigible.delete("/segments/#{id}")
  end
end
