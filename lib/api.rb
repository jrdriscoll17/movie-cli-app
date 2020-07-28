require_relative '../config/environment.rb'

class API
    def self.get_response(title, year = nil)
        formatted_year = "y=#{year}" if year

        omdb_url = "http://www.omdbapi.com/?apikey=1f082bdb&t=#{title}&#{formatted_year}"
        response = HTTParty.get(omdb_url)
    end
end