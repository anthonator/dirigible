# Dirigible

A Ruby wrapper for the Urban Airship v3 API

[![Dependency Status](https://gemnasium.com/anthonator/dirigible.png)](https://gemnasium.com/anthonator/dirigible) [![Code Climate](https://codeclimate.com/github/anthonator/dirigible.png)](https://codeclimate.com/github/anthonator/dirigible)

## Documentation

You can view detailed documentation of this library at http://rdoc.info/github/anthonator/dirigible/master/frames. We try to make sure that our documentation is up-to-date and thorough. However, we do recommend keeping the Urban Airship v3 API documentation handy.

If you find any discrepency in our documentation please [file an issue](https://github.com/anthonator/dirigible/issues).

## Installation

Add this line to your application's Gemfile:

    gem 'dirigible'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dirigible

## tl;dr

Configure dirigible...

```ruby
Dirigible.configure do |config|
  config.app_key = YOUR_APP_KEY
  config.master_secret = YOUR_MASTER_SECRET
end
```

Make an API request...

```ruby
begin
  response = Dirigible::Push.create({
    audience: { device_token: "998BAD77A8347EFE7920F5367A4811C4385D526AE42C598A629A73B94EEDBAC8" },
    notification: { alert: "Hello!" },
    device_types: "all"
  })
  puts "YAY!" if response[:ok] == true # All JSON responses are converted to hash's
rescue Dirigible::Error => e
  puts "BUSTED!!! #{e.message}"
end
```

## Configuration

In order to make any requests you must first configure your app key and master secret...

```ruby
Dirigible.configure do |config|
  config.app_key = YOUR_APP_KEY
  config.master_secret = YOUR_MASTER_SECRET
end
```

Change the HTTP library used for making requests to Urban Airship. Since we use [Faraday](https://github.com/lostisland/faraday) you can use any supported adapter...

```ruby
Dirigible.configure do |config|

  ...
  
  config.http_adapter = :excon
end
```

## Supported Endpoints

### Push

* [Send a push notification](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Push.create)
* [Validate a push notification](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Push.validate)

### Schedule

* [Schedule a notification](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Schedule.create)
* [List schedules](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Schedule.list)
* [List a specific schedule](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Schedule.get)
* [Update a schedule](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Schedule.update)
* [Delete a schedule](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Schedule.delete)

### Tag

* [List tags](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Tag.list)
* [Create a tag](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Tag.create)
* [Adding and removing devices from a tag](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Tag.add_or_remove)
* [Delete a tag](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Tag.delete)
* [Batch modification of tags](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Tag.batch)

### Feed

* [Create a feed](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Feed.create)
* [Get feed details](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Feed.get)
* [Update a feed](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Feed.update)
* [Delete a feed](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Feed.delete)

### Device Information

* [Get Android APID device information](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.get_apid)
* [Get Backberry PIN device information](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.get_device_pin)
* [Get iOS device token information](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.get_device_token)
* [List Android APID's registered to an application](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.list_apids)
* [List Blackberry PIN's registered to an application](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.list_device_pins)
* [Count iOS device tokens registered to an application](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.count_device_tokens)
* [List iOS device tokens registered to an application](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.list_device_tokens)
* [List iOS device tokens that can't recieve messages](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceInformation.device_token_feedback)

### Device Registration

* [Register an Android APID](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceRegistration.register_apid)
* [Register a Blackberry PIN device](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceRegistration.register_device_pin)
* [Register an iOS device token](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceRegistration.register_device_token)
* [Delete a Blackberry PIN device](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceRegistration.delete_device_pin)
* [Delete an iOS device token](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/DeviceRegistration.delete_device_token)

### Segment

* [List all segments for an application](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Segment.list)
* [Create a segment](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Segment.create)
* [Get a specific segment](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Segment.get)
* [Update a segment](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Segment.update)
* [Delete a segment](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Segment.delete)

### Location

* [Retrieve cutoff dates](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Location.cutoff_dates)
* [Look up location boundary information](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Location.from_alias)
* [Search for locations using a bounding box](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Location.search_by_bounding_box)
* [Search for a location by latitude and longitude](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Location.search_by_latlng)
* [Search for a location boundary by name](http://rdoc.info/github/anthonator/dirigible/master/Dirigible/Location.search_by_name)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits
[![Sticksnleaves](http://sticksnleaves-wordpress.herokuapp.com/wp-content/themes/sticksnleaves/images/snl-logo-116x116.png)](http://www.sticksnleaves.com)

Dirigible is maintained and funded by [Sticksnleaves](http://www.sticksnleaves.com)

Thanks to all of our [contributors](https://github.com/anthonator/dirigible/graphs/contributors)