# Vendorize

## Vendorize Assets into the Rails Asset Pipeline

### Installation

Add the gem to your Gemfile
```ruby
gem 'vendorize'
```

### Configure

Create a new configuration file in your engine.
```
$ rails generate vendorize:config
```

Vendorize has a simple configuration DSL for defining
where upstream assets should be retrieved.
```ruby
vendorize :jquery do
  version '1.9.0'

  javascript 'jquery.js',     "http://code.jquery.com/jquery-#{version}.js"
  javascript 'jquery.min.js', "http://code.jquery.com/jquery-#{version}.min.js"
end
```

### Usage

Vendorize the remote assets as specified by the config.
```
$ rake vendorize:update
```
