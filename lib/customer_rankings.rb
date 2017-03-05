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

end



