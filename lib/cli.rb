require_relative '../config/environment.rb'

class CLI
    def self.run
        print "Please enter the name of a movie you would like information on: "
        user_title = gets.strip
        print "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        user_year = gets.strip

        api_response = API.get_response(user_title, user_year)

        # if api_response["Error"]
        #     puts api_response["Error"]
        #     CLI.run
        # else
        #     movie = Movie.new(api_response)
        # end

        puts "Please enter the information you would like about #{movie.title}:\n\n"
        puts "'genre' for the movie's genre(s)"
        puts "'rating' for the movie's IMDB rating"
        puts "'plot' for a brief summary of the movie"
        puts "'year' for the movie's release date"
        puts "'runtime' for movie's length\n\n"
        print "Selection: "
        input = gets.strip

        case input
        when "genre" then puts movie.genre
        when "rating" then puts movie.rating
        when "plot" then puts movie.plot
        when "year" then puts movie.year
        when "runtime" then puts movie.runtime
        end
    end

    # binding.pry
end