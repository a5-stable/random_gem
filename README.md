# RandomGem

RandomGem is a Ruby gem that picks a random gem from RubyGems and returns its info.  
Also, it provides a command to add a random gem to your Gemfile.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'random_gem'
```



And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install random_gem

## Usage

### Selecting a random gem

`RandomGem.pick` returns the info of a random gem.

```ruby
require 'random_gem'

RandomGem.pick 
#=> { "documentation_uri"=>"XXXXX", ..., "name"=>"XXXX", "version_downloads"=>0, "info"=>"XXXX", "authors"=>"XXXX" }
```
### Adding a gem to your Gemfile
This command will add a random gem to your Gemfile on a new line.
```sh
bundle exec random_gem add
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a5-stable/random_gem.  


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Warning
When installing an unknown gem, it is important to verify that it is safe to use. While RandomGem selects random gems from RubyGems, it is not responsible for any issues that may arise from installing these gems. Please use this gem at your own risk and carefully consider the potential risks of installing unknown gems.

## Notes
RandomGem relies on the RubyGems API, so please ensure that you have a stable internet connection before using this gem.
