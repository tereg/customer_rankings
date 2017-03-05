require "spec_helper"

describe CustomerRankings do
  include CustomerRankings

  let(:score_1) { {"propensity"=>0.26532, "ranking"=>"C"} } 
  let(:score_2) { {"propensity"=>0.16555, "ranking"=>"D"} } 
  let(:score_3) { {"propensity"=>0.46532, "ranking"=>"A"} } 

  let(:desired_propensity_1) { 0.26532 }
  let(:desired_propensity_2) { 0.40030 }
  let(:desired_ranking_1) { "C" }
  let(:desired_ranking_2) { "A" }

  describe '#propensity_score' do
    it "returns an applicant's propensity score" do 
      expect(propensity_score(score_1)).to eq(0.26532)
      expect(propensity_score(score_2)).to eq(0.16555)
      expect(propensity_score(score_3)).to eq(0.46532)
    end  
  end 

  describe '#propensity_rating' do
    context "when applicant's propensity score is average" do
      it "returns average" do 
        expect(propensity_rating(desired_propensity_1, score_1)).to eq("The applicant's propensity score is average.")
      end 
    end 

    context "when applicant's propensity score is below average" do 
      it "returns below average" do
        expect(propensity_rating(desired_propensity_1, score_2)).to eq("The applicant's propensity score is below average.")
      end 
    end 

    context "when applicant's propensity score is above average" do 
      it "returns above average" do 
        expect(propensity_rating(desired_propensity_1, score_3)).to eq("The applicant's propensity score is above average.")
      end
    end 
  end

  describe '#score_difference' do
    it "calculates the difference between the desired score and the applicant's actual score" do
      expect(score_difference(desired_propensity_1, score_1)).to eq(0)
      expect(score_difference(desired_propensity_1, score_2)).to eq(0.09977)
      expect(score_difference(desired_propensity_1, score_3)).to eq(-0.2) 
    end 
  end 

  describe '#propensity_rating_summary' do
    it "returns a summary which includes propensity score, rating, and score difference" do 
      expect(propensity_rating_summary(score_1)).to eq("The applicant's propensity score is average. It is 0.26532 and the desired score is 0.26532. The difference is 0.")
      expect(propensity_rating_summary(score_2)).to eq("The applicant's propensity score is below average. It is 0.16555 and the desired score is 0.26532. The difference is 0.09977.")
      expect(propensity_rating_summary(score_3)).to eq("The applicant's propensity score is above average. It is 0.46532 and the desired score is 0.26532. The difference is -0.2.")
    end 
  end 

  describe '#ranking_score' do 
    it "returns an applicant's ranking score" do 
      expect(ranking_score(score_1)).to eq("C")
      expect(ranking_score(score_2)).to eq("D")
      expect(ranking_score(score_3)).to eq("A")
    end 
  end 

  describe '#ranking_rating' do
    context "when applicant's ranking score is average" do
      it "returns average" do 
        expect(ranking_rating(desired_ranking_1, score_1)).to eq("The applicant's ranking score is average.")
      end 
    end 


    context "when applicant's ranking score is below average" do 
      it "returns below average" do
        expect(ranking_rating(desired_ranking_1, score_2)).to eq("The applicant's ranking score is below average.")
      end 
    end 

    context "when applicant's ranking score is above average" do 
      it "returns above average" do 
        expect(ranking_rating(desired_ranking_1, score_3)).to eq("The applicant's ranking score is above average.") 
      end
    end 
  end 

  describe '#overall_summary' do 
    context "when applicant's propensity score and ranking are both average" do
      it "gives a summary which says both scores are average" do 
        expect(overall_summary(desired_propensity_1, desired_ranking_1, score_1)).to eq("The applicant's propensity score is average, and the ranking score is average. The propensity score is 0.26532 and the desired score is 0.26532. The difference is 0. The ranking score is C, and the desired ranking is C.")
      end 
     end  

    context "when applicant's propensity score and ranking are both below average" do
      it "gives a summary which says both scores are below average" do 
        expect(overall_summary(desired_propensity_1, desired_ranking_1, score_2)).to eq("The applicant's propensity score is below average, and the ranking score is below average. The propensity score is 0.16555 and the desired score is 0.26532. The difference is 0.09977. The ranking score is D, and the desired ranking is C.")
      end 
    end 

    context "when applicant's propensity score and ranking are both above average" do
      it "gives a summary which says both scores are above average" do 
        expect(overall_summary(desired_propensity_1, desired_ranking_1, score_3)).to eq("The applicant's propensity score is above average, and the ranking score is above average. The propensity score is 0.46532 and the desired score is 0.26532. The difference is -0.2. The ranking score is A, and the desired ranking is C.")
      end 
    end 

    context "when applicant's propensity score is average and ranking score is below average" do
      it "gives a summary which says propensity score is average and ranking score is below average" do 
        expect(overall_summary(desired_propensity_1, desired_ranking_2, score_1)).to eq("The applicant's propensity score is average, and the ranking score is below average. The propensity score is 0.26532 and the desired score is 0.26532. The difference is 0. The ranking score is C, and the desired ranking is A.")
      end 
    end

    context "when applicant's propensity score is average and ranking score is above average" do
      it "gives a summary which says propensity score is average and ranking score is above average" do 
        expect(overall_summary(desired_propensity_1, desired_ranking_2, score_1)).to eq("The applicant's propensity score is average, and the ranking score is below average. The propensity score is 0.26532 and the desired score is 0.26532. The difference is 0. The ranking score is C, and the desired ranking is A.")
      end 
    end

    context "when applicant's propensity score is below average and ranking score is  average" do
      it "gives a summary which says propensity score is below average and ranking score is average" do 
        expect(overall_summary(desired_propensity_2, desired_ranking_1, score_1)).to eq("The applicant's propensity score is below average, and the ranking score is average. The propensity score is 0.26532 and the desired score is 0.40030. The difference is 0.13498. The ranking score is C, and the desired ranking is C.")
      end 
    end
  end 


# I'm not sure how to test code without an actual API so I created an alternate method to test with an existing API.
  # describe '#get_album' do 
  #   def get_album(url, album, artist)
  #     url = url
  #     album = album
  #     artist = artist

  #     response = HTTParty.get("#{url}?q=album:#{album}%20artist:#{artist}&type=album")
  #     response.parsed_response
  #   end

  #   album = {
  #     "albums": { "href": "https://api.spotify.com/v1/search?query=album%3Aarrival+artist%3Aabba&type=album&offset=0&limit=20",
  #       "items": [
  #         {
  #           "album_type": "album",
  #           "artists": [
  #             {
  #               "external_urls": {
  #                 "spotify": "https://open.spotify.com/artist/0LcJLqbBmaGUft1e9Mm8HV"
  #               },
  #               "href": "https://api.spotify.com/v1/artists/0LcJLqbBmaGUft1e9Mm8HV",
  #               "id": "0LcJLqbBmaGUft1e9Mm8HV",
  #               "name": "ABBA",
  #               "type": "artist",
  #               "uri": "spotify:artist:0LcJLqbBmaGUft1e9Mm8HV"
  #             }
  #           ],
  #           "available_markets": [
  #             "CA",
  #             "MX",
  #             "US"
  #           ],
  #           "external_urls": {
  #             "spotify": "https://open.spotify.com/album/1M4anG49aEs4YimBdj96Oy"
  #           },
  #           "href": "https://api.spotify.com/v1/albums/1M4anG49aEs4YimBdj96Oy",
  #           "id": "1M4anG49aEs4YimBdj96Oy",
  #           "images": [
  #             {
  #               "height": 575,
  #               "url": "https://i.scdn.co/image/de30d4da9efd1b491493ed288e09b6f935ff10ab",
  #               "width": 640
  #             },
  #             {
  #               "height": 270,
  #               "url": "https://i.scdn.co/image/b8e2ae77e9379d27e33f39d2c2643cb52de1b8ac",
  #               "width": 300
  #             },
  #             {
  #               "height": 57,
  #               "url": "https://i.scdn.co/image/a346fc150b229c7818029110858b3d915cf9400e",
  #               "width": 63
  #             }
  #           ],
  #           "name": "Arrival",
  #           "type": "album",
  #           "uri": "spotify:album:1M4anG49aEs4YimBdj96Oy"
  #         }
  #       ],
  #       "limit": 20,
  #       "next": nil,
  #       "offset": 0,
  #       "previous": nil,
  #       "total": 1
  #     }
  #   }

  #   album = JSON.parse(album.to_json)

  #   it "returns a parsed json object when an API is queried" do
  #     expect(get_album("https://api.spotify.com/v1/search", "arrival", "abba")).to eq(album)
  #   end
  # end 
end 

   