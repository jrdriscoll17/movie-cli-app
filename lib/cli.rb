require_relative '../config/environment.rb'

class CLI
    def self.run
        puts "Please enter the name of a movie you would like information on: "
        user_title = gets.strip
        puts "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        user_year = gets.strip

        API.get_response(user_title, user_year)

        input = nil

        puts "Please enter the information you would like about #{@title}: "
        puts "'genre' for the movie's genre(s)"
        puts "'rating' for the movie's IMDB rating"
        puts "'plot' for a brief summary of the movie"
        puts "'year' for the movie's release date"
        puts "'runtime' for movie's length"
        input = gets.strip

        case input
        when "genre" then Movie.genre
        when "rating" then Movie.rating
        when "plot" then Movie.plot
        when "year" then Movie.year
        when "runtime" then Movie.runtime
        end
    end
end