# @note The Feed API still uses the version 1 Push API. In the future it will be upgraded to use the V3 push API.
# @see http://docs.urbanairship.com/reference/api/v3/feeds.html
class Dirigible::Feed
  # Creates a new feed.
  #
  # @example Example request:
  #   Dirigible::Feed.create({
  #     feed_url: "http://example.com/atom.xml",
  #     template: {
  #       aps: {
  #         badge: 1,
  #         sound: "cat.caf",
  #         alert: "New item from some place! {{ title }}"
  #       }
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#creating-a-new-feed
  def self.create(params)
    Dirigible.post('/feeds/', params)
  end

  # Returns information about that particular feed.
  #
  # @example Example request:
  #   Dirigible::Feed.get('<feed_id>')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#feed-details
  def self.get(id)
    Dirigible.get("/feeds/#{id}")
  end

  # Updates a feed with a new template
  #
  # @example Example request:
  #   Dirigible::Feed.update('<feed_id>', {
  #     template: {
  #       aps: {
  #         sound: "frog.caf",
  #         alert: "New update from Someplace! - {{ title }}"
  #       }
  #     },
  #     feed_url: "<new_feed_url>"
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#updating-a-feed
  def self.update(id, params)
    Dirigible.put("/feeds/#{id}", params)
  end

  # Removes a feed from the monitoring service, and stops new
  # pushes from being sent.
  #
  # @example Example request:
  #   Dirigible::Feed.delete('<feed_id>')
  #
  # @see http://docs.urbanairship.com/reference/api/v3/feeds.html#deleting-a-feed
  def self.delete(id)
    Dirigible.delete("/feeds/#{id}")
  end
end
