# @see http://docs.urbanairship.com/reference/api/v3/location.html
class Dirigible::Location
  # Search for a location boundary by name.
  #
  # @param query [String] Text search query.
  # @param boundary_type [String] Optional location type, e.g. city, province, or country.
  #
  # @example Example request:
  #   Dirigible::Location.search_by_name("Indianapolis", "city")
  #
  # @see http://docs.urbanairship.com/reference/api/v3/location.html#location-boundary-information
  def self.search_by_name(query, boundary_type = nil)
    Dirigible.get('/location/', { q: query, type: boundary_type })
  end

  # Search for a location by latitude and longitude.
  #
  # @param lat [Decimal] Latitude coordinate.
  # @param lng [Decimal] Longitude coordinate.
  # @param boundary_type [String] Optional location type, e.g. city, province, or country.
  #
  # @example Example request:
  #   Dirigible::Location.search_by_latlng("37.7749295", "-122.4194155", "city")
  #
  # http://docs.urbanairship.com/reference/api/v3/location.html#location-boundary-information
  def self.search_by_latlng(lat, lng, boundary_type = nil)
    Dirigible.get("/location/#{lat},#{lng}", { type: boundary_type })
  end

  # Search for locations using a bounding box. A bounding box
  # is a rectangle that covers part of the earth.
  #
  # @param bounding_box [Decimal Array] Multi-dimentional array of latitude and longitude pairs.
  # @param boundary_type [String] Optional location type, e.g. city, province, or country.
  #
  # @example Example request:
  #   Dirigible::Location.search_by_bounding_box([["37.805172690644405", "-122.44863510131836"], ["37.77654930110633", "-122.39404678344727"]], "postalcode")
  #
  # @see http://docs.urbanairship.com/reference/api/v3/location.html#location-boundary-information
  def self.search_by_bounding_box(bounding_box, boundary_type = nil)
    Dirigible.get("/location/#{bounding_box.join(',')}", { type: boundary_type })
  end

  # Look up location boundary information based on
  # real-world references. Multiple queries may be passed
  # in one API call.
  #
  # @example Example request:
  #   Dirigible::Location.from_alias({ us_state: "IN" })
  #
  # @see http://docs.urbanairship.com/reference/api/v3/location.html#location-boundary-information
  def self.from_alias(query)
    Dirigible.get("/location/from-alias", query)
  end

  # Retrieve cutoff dates for each time granularity.
  #
  # @example Example request:
  #   Dirigible::Location.cutoff_dates
  #
  # @see http://docs.urbanairship.com/reference/api/v3/location.html#location-data-ranges
  def self.cutoff_dates
    Dirigible.get("/segments/dates/")
  end
end
