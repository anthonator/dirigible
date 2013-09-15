# Dirigible

A Ruby wrapper for the Urban Airship v3 API

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

## Getting Started

Configure dirigible...

```ruby
Dirigible.configure do |config|
  config.app_key = YOUR_APP_KEY
  config.master_secret = YOUR_MASTER_SECRET
end
```

Make an API request

```ruby
begin
  Dirigible::Push.create({
    audience: { device_token: "998BAD77A8347EFE7920F5367A4811C4385D526AE42C598A629A73B94EEDBAC8" },
    notification: {alert: "Hello!" },
    device_types: "all"
  })
rescue Dirigible::Error => e
  puts "BUSTED!!!"
end
```

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