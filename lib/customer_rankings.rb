require "customer_rankings/version"
require "httparty"

module CustomerRankings
  include HTTParty

  def get_average_score(url, income, zip_code, age)
    url = url
    income = income
    zip_code = zip_code
    age = age 

    response = HTTParty.get("#{url}/customer_scoring?income=#{income}&zipcode=#{zip_code}&age=#{age}")
    response.parsed_response
  end 

  def propensity_score(score)
    score["propensity"]
  end 

  def propensity_rating(desired_propensity, score)
    propensity_score = propensity_score(score)
    if desired_propensity == propensity_score
      "The applicant's propensity score is average."
    elsif desired_propensity < propensity_score
      "The applicant's propensity score is above average."
    else 
      "The applicant's propensity score is below average."  
    end 
  end 

  def score_difference(desired_propensity, score)
    propensity_score = propensity_score(score)
    desired_propensity - propensity_score 
  end 

end



