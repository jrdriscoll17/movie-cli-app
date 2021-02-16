class API
    def self.get_response(title, year = nil)
        formatted_year = "y=#{year}" if year

        omdb_url = "http://www.omdbapi.com/?apikey=1f082bdb&t=#{title}&#{formatted_year}"
        response = HTTParty.get(omdb_url)

        response["Error"] ? response : attributes = {
            :title => response["Title"],
            :year => response["Year"],
            :genre => response["Genre"],
            :plot => response["Plot"],
            :runtime => response["Runtime"],
            :rating => response["imdbRating"]
        }
    end
end