class CLI
    def get_movie
        print "Please enter the name of a movie you would like information on: "
        user_title = gets.strip

        while user_title == ""
            puts "\nYou must enter a movie title!"
            print "Please enter the name of a movie you would like information on: "
            user_title = gets.strip
        end

        print "Please enter the year the movie was made (press enter if you do not wish to provide the year): "
        user_year = gets.strip

        if user_year
            movie_from_array = Movie.all.find do |movie|
                movie.title.downcase.include?(user_title.downcase) && movie.title.downcase.include?(user_year)
            end
        else
            movie_from_array = Movie.all.find{|movie| movie.title.downcase.include?(user_title.downcase)}
        end

        if movie_from_array != nil
            movie_from_array
        else
            api_response = API.get_response(user_title, user_year)

            if api_response == nil
                puts "Movie not found!"
                self.run
            elsif api_response["Error"]
                puts api_response["Error"]
                self.run
            else
                Movie.new(api_response)
            end
        end
    end

    def get_movie_info(movie, input)
        if input != "genre" && input != "rating" && input != "plot" &&
           input != "year" && input != "runtime" && input != "exit" &&
           input != "new"

           puts "Please enter a valid option (or type exit to quit)!"
           print "Selection: "
           input = gets.strip
        end

        case input
        when "genre" then puts "\n\n#{movie.genre}".colorize(:cyan)
        when "rating" then puts "\n\n#{movie.rating}".colorize(:cyan)
        when "plot" then puts "\n\n#{movie.plot}".colorize(:cyan)
        when "year" then puts "\n\n#{movie.year}".colorize(:cyan)
        when "runtime" then puts "\n\n#{movie.runtime}".colorize(:cyan)
        when "exit" then exit
        when "new" then self.run
        end
    end

    def options(movie)
        self.clear_screen
        puts "\n\n***************************************************************".colorize(:green)
        puts "What information would you like to see for #{movie.title}?\n".colorize(:cyan)
        puts "1. ".colorize(:cyan) + "Type " + "'genre' ".colorize(:red) + "for the movie's genre(s)"
        puts "2. ".colorize(:cyan) + "Type " + "'rating' ".colorize(:red) + "for the movie's IMDB rating"
        puts "3. ".colorize(:cyan) + "Type " + "'plot' ".colorize(:red) + "for a brief summary of the movie"
        puts "4. ".colorize(:cyan) + "Type " + "'year' ".colorize(:red) + "for the movie's release date"
        puts "5. ".colorize(:cyan) + "Type " + "'runtime' ".colorize(:red) + "for movie's length"
        puts "***************************************************************\n\n".colorize(:green)
        puts "Type " + "'exit' ".colorize(:red) + "when finished or " + "'new' ".colorize(:cyan) + "to select a different title!"
        print "Selection: "
    end

    def run_with_greeting
        self.clear_screen
        puts "\n\n*******************************".colorize(:green)
        puts " WELCOME TO THE MOVIE DATABASE".colorize(:cyan)
        puts "*******************************\n\n".colorize(:green)
        self.run
    end

    def clear_screen
        puts "\e[H\e[2J"
    end

    def run
        movie = self.get_movie
        options(movie)
        input = gets.strip

        self.get_movie_info(movie, input)

        while input != "exit"
            sleep 2
            self.options(movie)
            input = gets.strip
            self.clear_screen if input == "new"
            self.get_movie_info(movie, input)
        end
    end
end