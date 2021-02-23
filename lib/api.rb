class API
    def self.get_response(movie)
        formatted_year = "y=#{movie[:year]}" if movie[:year] != ""

        omdb_url = "http://www.omdbapi.com/?apikey=1f082bdb&t=#{movie[:title]}&#{formatted_year}"
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