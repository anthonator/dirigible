class Dirigible::Tag
  # List tags that exist for this application.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#tag-listing
  def self.list
    Dirigible.get('/tags')
  end

  # Explicitly create a tag with no devices associated with
  # it.
  #
  # @note This call is optional; tags are created implicitly when devices are added to them. You might use this to pre-create the list for your Push Composer users, however.
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#tag-creation
  def self.create(tag)
    Dirigible.put("/tags/#{tag}")
  end

  # Delete a tag and remove it from all devices.
  #
  # A tag can be fully removed from Urban Airship by issuing
  # a delete. This will remove the master record of the tag,
  # and will remove the tag from all devices.
  #
  # @note The removal process can take a long time if many devices use this tag.
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#deleting-a-tag
  def self.delete(tag)
    Dirigible.delete("/tags/#{tag}")
  end

  # Add or remove one or more device tokens, APIDs, or PINs
  # to a particular tag.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#adding-and-removing-devices-from-a-tag
  def self.add_or_remove(tag, params)
    Dirigible.post("/tags/#{tag}", params)
  end

  # Modify the tags for a number of device tokens or apids.
  #
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#batch-modification-of-tags
  def self.batch(params)
    Dirigible.post("/tags/batch", params)
  end
end
