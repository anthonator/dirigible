# @note The Feed API still uses the version 1 Push API. In the future it will be upgraded to use the V3 push API.
class Dirigible::Feed
  # Creates a new feed.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#creating-a-new-feed
  def self.create(params)
    Dirigible.post('/feeds', params)
  end

  # Returns information about that particular feed.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#feed-details
  def self.get(id)
    Dirigible.get("/feeds/#{id}")
  end

  # Updates a feed with a new template
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#updating-a-feed
  def self.update(id, params)
    Dirigible.put("/feeds/#{id}", params)
  end

  # Removes a feed from the monitoring service, and stops new
  # pushes from being sent.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#deleting-a-feed
  def self.delete(id)
    Dirigible.delete("/feeds/#{id}")
  end
end
