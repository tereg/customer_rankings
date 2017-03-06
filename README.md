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

  + *returns a parsed json object that includes propensity and ranking scores* 
  + *url should be passed in as a string; income, zip_code, and age should be passed in as integers* 
  + *Sample request:  
  get_average_score("http://not_real.com/customer_scoring", 50000, 60201, 35)*
  + *Sample response:  
  {"propensity"=>0.26532, "ranking"=>"C"}*

The return value of the ```get_average_score``` method can be passed to the methods below as score:


```propensity_score(score)```  

  + *returns an applicant's propensity score*  
  + *Sample request:  
  propensity_score({"propensity"=>0.26532, "ranking"=>"C"})*
  + *Sample response:  
  0.26532*

```propensity_rating(desired_propensity, score)```

  + *ranks an applicant's propensity score as average, below average, or above average in comparison with a desired propensity*
  + *Sample request:  
  propensity_rating(0.26532, {"propensity"=>0.26532, "ranking"=>"C"})*
  + *Sample response:  
  "The applicant's propensity score is average."*

```score_difference(desired_propensity, score)```

  + *calculates the difference between the desired propensity and the applicant's propensity*  
  + *Sample request:  
  score_difference(0.26532, {"propensity"=>0.16555, "ranking"=>"D"})*
  + *Sample response:  
  0.09977*


```propensity_rating_summary(desired_propensity, score)```

  + *returns a summary which includes propensity score, rating, and score difference*
  + *Sample request:  
  propensity_rating_summary(0.26532, {"propensity"=>0.16555, "ranking"=>"D"})*
  + *Sample response:  
  "The applicant's propensity score is below average. It is 0.16555 and the desired score is 0.26532. The difference is 0.09977."*

```ranking_score(score)```

  + *returns an applicant's ranking score*
  + *Sample request:  
  ranking_score({"propensity"=>0.16555, "ranking"=>"D"})*
  + *Sample response:  
  "D"*

```ranking_rating(desired_ranking, score)```

  + *evaluates an applicant's ranking score as average, below average, or above average in comparison with a desired ranking*
  + *Sample request:  
  ranking_rating("C", {"propensity"=>0.26532, "ranking"=>"C"})*
  + *Sample response:  
  "The applicant's ranking score is average."*

```overall_summary(desired_propensity, desired_ranking, score)```

  + *returns an overview of the applicant's propensity and ranking; summarizes all the information in the methods above*
  + *Sample request:  
  overall_summary(0.26532, "C", {"propensity"=>0.26532, "ranking"=>"C"} )*
  + *Sample response:  
  "The applicant's propensity score is average, and the ranking score is average. The propensity score is 0.26532 and the desired score is 0.26532. The difference is 0.0. The ranking score is C, and the desired ranking is C."*

## Dependencies

  + ruby 2.3.1  
  + "httparty" gem  
  + "json" gem

<!-- ## Development
 -->
<!-- After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org). -->

<!-- ## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/customer_rankings.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT). -->

