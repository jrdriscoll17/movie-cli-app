class CLI
    def run
        puts "Please enter the name of a movie you would like information on: "
        user_title = gets.strip
        puts "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        user_year = gets.strip

        Movie.new(user_title, user_year)
    end
end