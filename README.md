# CustomerRankings

A library used to determine if an applicant's propensity and ranking are above average, average, or below average.

## Installation

Add this line to your application's Gemfile:

```
gem 'customer_rankings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install customer_rankings

## Usage

The following methods are available:

```get_average_score(url, income, zip_code, age)```

    #returns a parsed json object that includes propensity and ranking scores
    #Sample response:
    {"propensity"=>0.26532, "ranking"=>"C"}

The return value of the ```get_average_score``` method can be passed to the methods below as score:


    propensity_score(score)

    propensity_rating(desired_propensity, score)

    score_difference(desired_propensity, score)

    propensity_rating_summary(desired_propensity, score)

    ranking_score(score)

    ranking_rating(desired_ranking, ranking_score)

    overall_summary(desired_propensity, desired_ranking, score)










## Dependencies

ruby 2.3.1

This gem incorporates functionality from the following gems:
"httparty" gem
"json" gem

## Development

<!-- After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org). -->

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/customer_rankings.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

