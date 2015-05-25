# @see http://docs.urbanairship.com/reference/api/v3/segments.html
class Dirigible::Segment
  # List all of the segments for the application.
  #
  # @example Example request:
  #   Dirigible::Segment.list
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segments-information
  def self.list
    Dirigible.get('/segments/')
  end

  # Fetch information about a particular segment.
  #
  # @example Example request:
  #   Dirigible::Segment.get("0c0d899-a595-4c66-9071-bc59374bbe6b")
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segments-information
  def self.get(id)
    Dirigible.get("/segments/#{id}")
  end

  # Create a new segment.
  #
  # @example Example request:
  #   Dirigible::Segment.create({
  #     display_name: "News but not sports",
  #     criteria: {
  #       and: [
  #         { tag: "news" },
  #         { not: { tag: "sports" } }
  #       ]
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def self.create(params)
    Dirigible.post('/segments/', params)
  end

  # Change the definition of the segment.
  #
  # @example Example request:
  #   Dirigible::Segment.update("00c0d899-a595-4c66-9071-bc59374bbe6b", {
  #     display_name: "Entertainment but not sports",
  #     criteria: {
  #       and: [
  #         { tag: "news" },
  #         { not: { tag: "entertainment" } }
  #       ]
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def self.update(id, params)
    Dirigible.put("/segments/#{id}", params)
  end

  # Remove the segment.
  #
  # @example Example request:
  #   Dirigible::Segment.delete("00c0d899-a595-4c66-9071-bc59374bbe6b")
  #
  # @see http://docs.urbanairship.com/reference/api/v3/segments.html#segment-creation
  def self.delete(id)
    Dirigible.delete("/segments/#{id}")
  end
end
