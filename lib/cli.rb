require_relative '../config/environment.rb'

class CLI
    def self.get_movie
        print "Please enter the name of a movie you would like information on: "
        user_title = gets.strip
        print "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        user_year = gets.strip

        api_response = API.get_response(user_title, user_year)

        if api_response["Error"]
            puts api_response["Error"]
            CLI.run
        else
            movie = Movie.new(api_response)
        end
    end


    def self.get_movie_info
        # movie = get_movie
        input = gets.strip

        case input
        when "genre" then puts get_movie.genre
        when "rating" then puts get_movie.rating
        when "plot" then puts get_movie.plot
        when "year" then puts get_movie.year
        when "runtime" then puts get_movie.runtime
        when "exit" then exit
        end
    end

    def self.run
        puts "What information would you like to see?\n\n"
        puts "'genre' for the movie's genre(s)"
        puts "'rating' for the movie's IMDB rating"
        puts "'plot' for a brief summary of the movie"
        puts "'year' for the movie's release date"
        puts "'runtime' for movie's length\n\n"
        print "Selection: "

        get_movie_info
    end
    # binding.pry
end