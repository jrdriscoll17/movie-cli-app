class CLI
    def self.get_movie
        print "Please enter the name of a movie you would like information on: "
        user_title = gets.strip
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
                run
            elsif api_response["Error"]
                puts api_response["Error"]
                run
            else
                Movie.new(api_response)
            end
        end
    end

    def self.get_movie_info(movie, input)
        if input != "genre" && input != "rating" && input != "plot" &&
           input != "year" && input != "runtime" && input != "exit" &&
           input != "new"

           puts "Please enter a valid option (or type exit to quit)!"
           print "Selection: "
           input = gets.strip
        end

        case input
        when "genre" then puts "\n\n#{movie.genre}".colorize(:blue)
        when "rating" then puts "\n\n#{movie.rating}".colorize(:blue)
        when "plot" then puts "\n\n#{movie.plot}".colorize(:blue)
        when "year" then puts "\n\n#{movie.year}".colorize(:blue)
        when "runtime" then puts "\n\n#{movie.runtime}".colorize(:blue)
        when "exit" then exit
        when "new" then run
        end
    end

    def self.options(movie)
        clear_screen
        puts "\n\n***************************************************************".colorize(:green)
        puts "What information would you like to see for #{movie.title}?\n".colorize(:blue)
        puts "1. ".colorize(:blue) + "'genre' ".colorize(:red) + "for the movie's genre(s)"
        puts "2. ".colorize(:blue) + "'rating' ".colorize(:red) + "for the movie's IMDB rating"
        puts "3. ".colorize(:blue) + "'plot' ".colorize(:red) + "for a brief summary of the movie"
        puts "4. ".colorize(:blue) + "'year' ".colorize(:red) + "for the movie's release date"
        puts "5. ".colorize(:blue) + "'runtime' ".colorize(:red) + "for movie's length"
        puts "***************************************************************\n\n".colorize(:green)
        puts "Type " + "'exit' ".colorize(:red) + "when finished or " + "'new' ".colorize(:blue) + "to select a different title!"
        print "Selection: "
    end

    def self.run_with_greeting
        clear_screen
        puts "\n\n*******************************".colorize(:green)
        puts " WELCOME TO THE MOVIE DATABASE".colorize(:blue)
        puts "*******************************\n\n".colorize(:green)
        run
    end

    def self.clear_screen
        puts "\e[H\e[2J"
    end

    def self.run
        movie = get_movie
        options(movie)
        input = gets.strip

        get_movie_info(movie, input)

        while input != "exit"
            sleep 2
            options(movie)
            input = gets.strip
            clear_screen if input == "new"
            get_movie_info(movie, input)
        end
    end
end