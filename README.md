# Chaperone

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'chaperone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chaperone

## Usage

```ruby
require 'chaperone'

Chaperone.configure do |conf|
  conf.domain = 'https://dashboard.pagodabox.com'
  conf.user = 'usr'
  conf.pass = 'pass'
  conf.default_block do |req|
    req.url "#{req.path.gsub(/\/$/, '')}.json"
  end
end

class App
  extend Chaperone::Route
end

class App::Component
  extend Chaperone::Route
end

class App::Service
  extend Chaperone::Route
end

class App::Service::Generation
  extend Chaperone::Route
end

class App::Service::Generation::Member
  extend Chaperone::Route
end

App.list do |req|
  req.url '/cows'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "name": "Unagi" }'
end

App::Service.list('app_id')
App::Service.update('app_id', 'service_id') {|req| req.params = {thing: 1, other: 'two'}}
App::Service::Generation.delete('app_id', 'service_id', 'gen_id')
App::Service::Generation::Member.create('app_id', 'service_id','gen_id') {|req| req.params = {thing: 1, other: 'two'}}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
