require "spec_helper"

describe CustomerRankings do
  include CustomerRankings

  describe '#get_album' do 
    def get_album(url, album, artist)
      url = url
      album = album
      artist = artist

      response = HTTParty.get("#{url}?q=album:#{album}%20artist:#{artist}&type=album")
      response.parsed_response
    end

    album = {
      "albums": { "href": "https://api.spotify.com/v1/search?query=album%3Aarrival+artist%3Aabba&type=album&offset=0&limit=20",
        "items": [
          {
            "album_type": "album",
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/0LcJLqbBmaGUft1e9Mm8HV"
                },
                "href": "https://api.spotify.com/v1/artists/0LcJLqbBmaGUft1e9Mm8HV",
                "id": "0LcJLqbBmaGUft1e9Mm8HV",
                "name": "ABBA",
                "type": "artist",
                "uri": "spotify:artist:0LcJLqbBmaGUft1e9Mm8HV"
              }
            ],
            "available_markets": [
              "CA",
              "MX",
              "US"
            ],
            "external_urls": {
              "spotify": "https://open.spotify.com/album/1M4anG49aEs4YimBdj96Oy"
            },
            "href": "https://api.spotify.com/v1/albums/1M4anG49aEs4YimBdj96Oy",
            "id": "1M4anG49aEs4YimBdj96Oy",
            "images": [
              {
                "height": 575,
                "url": "https://i.scdn.co/image/de30d4da9efd1b491493ed288e09b6f935ff10ab",
                "width": 640
              },
              {
                "height": 270,
                "url": "https://i.scdn.co/image/b8e2ae77e9379d27e33f39d2c2643cb52de1b8ac",
                "width": 300
              },
              {
                "height": 57,
                "url": "https://i.scdn.co/image/a346fc150b229c7818029110858b3d915cf9400e",
                "width": 63
              }
            ],
            "name": "Arrival",
            "type": "album",
            "uri": "spotify:album:1M4anG49aEs4YimBdj96Oy"
          }
        ],
        "limit": 20,
        "next": nil,
        "offset": 0,
        "previous": nil,
        "total": 1
      }
    }

    album = JSON.parse(album.to_json)

    it "returns a parsed json object when an API is queried" do
      expect(get_album("https://api.spotify.com/v1/search", "arrival", "abba")).to eq(album)
    end
  end 
end 

   