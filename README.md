# Rack::XServedBy [![Code Climate](https://codeclimate.com/github/3scale/rack-x_served_by/badges/gpa.svg)](https://codeclimate.com/github/3scale/rack-x_served_by)


Rack::XServedBy is a Rack middleware, that adds `X-Served-By` HTTP header to your responses.

That is useful if load balance between many servers and want to know which one served the request.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-x_served_by'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-x_served_by

## Usage



In config.ru

```ruby
use Rack::XServedBy

run YourApp
```


Or in Rails `config/application.rb`

```ruby

module YourApp
  class Application < Rails::Application
    config.middleware.use Rack::XServedBy
  end
end  
```

You can configure custom hostname as:

```ruby
use Rack::XServedBy, 'custom-hostname'
```


With example `config.ru`:

```
$ curl -v localhost:9292

* Rebuilt URL to: localhost:9292/
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 9292 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.37.1
> Host: localhost:9292
> Accept: */*
>
< HTTP/1.1 200 OK
< X-Served-By: Michals-MacBook-Pro.local
< Transfer-Encoding: chunked
* Server WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13) is not blacklisted
< Server: WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13)
< Date: Fri, 22 May 2015 13:37:22 GMT
< Connection: Keep-Alive
<
* Connection #0 to host localhost left intact
Hello, world%
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/3scale/rack-x_served_by/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
