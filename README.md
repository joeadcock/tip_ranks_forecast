# TipRanksForecast

TipRanksForecast queries TipRanks for a stock's price target and Wall Street analyst consensus.  This is only intended only personal/hobby use, as it is probably not a stable solution longterm.  It is not advised to use this in a production or critical system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tip_ranks_forecast', github: 'joeadcock/tip_ranks_forecast'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install specific_install
    $ gem specific_install https://github.com/joeadcock/tip_ranks_forecast.git

## Usage
NOTE: all prices are in cents

```
symbol = 'TSLA'
tipranks = TipRanksForecast::Stock.new(symbol)
tipranks.price_target
 => 74135
tipranks.low_forecast
 => 16000
tipranks.high_forecast
 => 120000
tipranks.num_analysts
 => 21
tipranks.buy_ratings
 => 10
tipranks.hold_ratings
 => 7
tipranks.sell_ratings
 => 4
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tip_ranks_forecast. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/tip_ranks_forecast/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TipRanksForecast project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tip_ranks_forecast/blob/master/CODE_OF_CONDUCT.md).
