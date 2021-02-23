class Movie
    attr_accessor :title, :year, :genre, :rating, :plot, :runtime
    @@searches = {}

    def initialize(search, response)
        response.each{|attribute, value| self.send("#{attribute}=", value)}
        @@searches[search] = self
    end

    def self.searches
        @@searches
    end

    def self.get_movie(movie)
        return @@searches[movie] if @@searches.has_key?(movie)
        
        api_response = API.get_response(movie)

        if api_response["Error"]
            puts api_response["Error"]
            self.run
        else
            Movie.new(movie, api_response)
        end
    end

    def self.get_movie_info_selection(movie, input)
        case input
        when "genre" then puts "\n\nGenre(s): #{movie.genre}".colorize(:cyan)
        when "rating" then puts "\n\nIMDB Rating: #{movie.rating}".colorize(:cyan)
        when "plot" then puts "\n\nPlot Summary: #{movie.plot}".colorize(:cyan)
        when "year" then puts "\n\nRelease year: #{movie.year}".colorize(:cyan)
        when "runtime" then puts "\n\nRuntime: #{movie.runtime}".colorize(:cyan)
        else
            false
        end
    end
end