class CLI
    def run
        puts "Please enter the name of a movie you would like information on: "
        user_title = gets.strip
        puts "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        user_year = gets.strip

        API.new(user_title, user_year)

        input = nil

        puts "Please enter the information you would like about #{@title}: "
        puts "'genre' for the movies genre(s)"
        puts "'rating' for teh movies IMDB rating"
        puts "'plot' for a brief summary of the movie"
        puts "'year' for the movie's release date"
        puts "'runtime' for movie's length"
        input = gets.strip

        case input
        when "genre" then display_genre
        when "rating" then display_rating
        when "plot" then display_plot
        when "year" then display_year
        when "runtime" then display_runtime
        end
    end
end