# @see http://docs.urbanairship.com/reference/api/v3/tags.html
class Dirigible::Tag
  # List tags that exist for this application.
  #
  # @example Example request:
  #   Dirigible::Tag.list
  #
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#tag-listing
  def self.list
    Dirigible.get('/tags/')
  end

  # Explicitly create a tag with no devices associated with
  # it.
  #
  # @example Example request:
  #   Dirigible::Tag.create("some_new_tag")
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
  # @example Example request:
  #   Dirigible::Tag.delete("some_new_tag")
  #
  # @note The removal process can take a long time if many devices use this tag.
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#deleting-a-tag
  def self.delete(tag)
    Dirigible.delete("/tags/#{tag}")
  end

  # Add or remove one or more device tokens, APIDs, or PINs
  # to a particular tag.
  #
  # @example Example request:
  #   Dirigible::Tag.add_or_remove("some_new_tag", {
  #     device_tokens: {
  #       add: ["device_token_1_to_add", "device_token_2_to_add"]
  #     },
  #     apids: {
  #       remove: ["apid_1_to_remove"]
  #     }
  #   })
  #
  # @example Full capability:
  #   Dirigible::Tag.add_or_remove("some_new_tag", {
  #     device_tokens: {
  #       add: ["device_token_1_to_add", "device_token_2_to_add"],
  #       remove: ["device_token_to_remove"]
  #     },
  #     device_pins: {
  #       add: ["device_pin_1_to_add", "device_pin_2_to_add"],
  #       remove: ["device_pin_to_remove"]
  #     },
  #     apids: {
  #       add: ["apid_1_to_add", "apid_2_to_add"],
  #       remove: ["apid_to_remove"]
  #     }
  #   })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#adding-and-removing-devices-from-a-tag
  def self.add_or_remove(tag, params)
    Dirigible.post("/tags/#{tag}", params)
  end

  # Modify the tags for a number of device tokens or apids.
  #
  # You must include an object containing either a
  # device_token or apid section and also containing a tags
  # section to apply the tags.
  #
  # @example Example request:
  #   Dirigible::Tag.batch([
  #     {
  #       device_token: "device_token_tag_tag_1",
  #       tags: [
  #         "tag_to_apply_1",
  #         "tag_to_apply_2",
  #         "tag_to_apply_3"
  #       ]
  #     },
  #     {
  #       device_token: "device_token_to_tag_2",
  #       tags: [
  #         "tag_to_apply_1",
  #         "tag_to_apply_4",
  #         "tag_to_apply_5"
  #       ]
  #     },
  #     {
  #       apid: "apid_to_tag_2",
  #       tags: [
  #         "tag_to_apply_1",
  #         "tag_to_apply_4",
  #         "tag_to_apply_5"
  #       ]
  #     }
  #   ])
  #
  # @see http://docs.urbanairship.com/reference/api/v3/tags.html#batch-modification-of-tags
  def self.batch(params)
    Dirigible.post("/tags/batch/", params)
  end
end
