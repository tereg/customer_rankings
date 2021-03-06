require "customer_rankings/version"
require "httparty"

module CustomerRankings
  include HTTParty

  def get_average_score(url, income, zip_code, age)
    url = url
    income = income
    zip_code = zip_code
    age = age 

    response = HTTParty.get("#{url}?income=#{income}&zipcode=#{zip_code}&age=#{age}")
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

  def propensity_rating_summary(desired_propensity, score)
    propensity_score = propensity_score(score)
    propensity_rating = propensity_rating(desired_propensity, score)
    score_difference = score_difference(desired_propensity, score)

    "#{propensity_rating} It is #{propensity_score} and the desired score is #{desired_propensity}. The difference is #{score_difference}."
  end 

  def ranking_score(score)
    score["ranking"]
  end 

  def ranking_rating(desired_ranking, score)
    ranking_score = ranking_score(score)

    if ranking_score == desired_ranking
      "The applicant's ranking score is average."
    elsif ranking_score < desired_ranking
      "The applicant's ranking score is above average."
    else
      "The applicant's ranking score is below average."
    end 
  end 

  def overall_summary(desired_propensity, desired_ranking, score)
    propensity_score = propensity_score(score)
    ranking_score = ranking_score(score)
    propensity_rating = (propensity_rating(desired_propensity, score)).chop
    score_difference = score_difference(desired_propensity, score)
    ranking_rating = (ranking_rating(desired_ranking, score)).downcase.gsub("applicant's ", "")

    "#{propensity_rating}, and #{ranking_rating} The propensity score is #{propensity_score} and the desired score is #{desired_propensity}. The difference is #{score_difference}. The ranking score is #{ranking_score}, and the desired ranking is #{desired_ranking}."
  end 
end



