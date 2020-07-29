require_relative '../config/environment.rb'

class CLI
    attr_accessor :user_title, :user_year

    def self.get_movie
        api_response = API.get_response(@user_title, @user_year)

        if api_response["Error"]
            puts api_response["Error"]
            CLI.run
        else
            Movie.new(api_response)
        end
    end

    def self.get_movie_info(movie)
        input = gets.strip

        if input != "genre" && input != "rating" && input != "plot" &&
           input != "year" && input != "runtime" && input != "exit"

           puts "Please enter a valid option!"
           print "Selection: "
           get_movie_info(movie)
        end

        case input
        when "genre" then puts movie.genre
        when "rating" then puts movie.rating
        when "plot" then puts movie.plot
        when "year" then puts movie.year
        when "runtime" then puts movie.runtime
        when "exit" then exit
        end
    end

    def self.run
        print "Please enter the name of a movie you would like information on: "
        @user_title = gets.strip
        print "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        @user_year = gets.strip

        movie = get_movie

        puts "\n\nWhat information would you like to see?\n\n"
        puts "'genre' for the movie's genre(s)"
        puts "'rating' for the movie's IMDB rating"
        puts "'plot' for a brief summary of the movie"
        puts "'year' for the movie's release date"
        puts "'runtime' for movie's length\n\n"
        print "Selection: "

        get_movie_info(movie)
    end
end