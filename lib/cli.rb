class CLI
    def get_movie_title_and_year
        print "Please enter the name of a movie you would like information on: "
        user_title = gets.strip

        while user_title == ""
            puts "\nYou must enter a movie title!"
            print "Please enter the name of a movie you would like information on: "
            user_title = gets.strip
        end

        print "Please enter the year the movie was made (ENTER to skip): "
        user_year = gets.strip

        movie = {title: user_title, year: user_year}
    end

    def self.display_options(movie)
        CLI.clear_screen
        puts "\n\n***************************************************************".colorize(:green)
        puts "What information would you like to see for #{movie.title}?\n".colorize(:cyan)
        puts "1. ".colorize(:cyan) + "Type " + "'genre' ".colorize(:red) + "for the movie's genre(s)"
        puts "2. ".colorize(:cyan) + "Type " + "'rating' ".colorize(:red) + "for the movie's IMDB rating"
        puts "3. ".colorize(:cyan) + "Type " + "'plot' ".colorize(:red) + "for a brief summary of the movie"
        puts "4. ".colorize(:cyan) + "Type " + "'year' ".colorize(:red) + "for the movie's release date"
        puts "5. ".colorize(:cyan) + "Type " + "'runtime' ".colorize(:red) + "for movie's length"
        puts "\n***************************************************************\n".colorize(:green)
        puts "Type " + "'exit' ".colorize(:red) + "when finished or " + "'new' ".colorize(:cyan) + "to select a different title!"
        print "\nSelection: "
    end

    def self.select_from_options(movie)
        input = gets.strip.downcase

        if input == "new"
            self.new.run
        elsif input == "exit"
            exit
        else
            while Movie.get_movie_info_selection(movie, input) == false
                puts "Please enter a valid option (or type exit to quit)!"
                print "Selection: "
                self.select_from_options(movie)
            end
            print "Would you like to make a different selection? (Y/n)"
            should_continue = gets.strip

            if should_continue.downcase == "y" || should_continue == ""
                CLI.display_options(movie) 
                self.select_from_options(movie)
            else
                exit
            end
        end
    end

    def self.clear_screen
        puts "\e[H\e[2J"
    end

    def run
        CLI.clear_screen
        puts "\n\n*******************************".colorize(:green)
        puts " WELCOME TO THE MOVIE DATABASE".colorize(:cyan)
        puts "*******************************\n".colorize(:green)
        user_selection = self.get_movie_title_and_year
        movie = Movie.get_movie(user_selection)

        CLI.display_options(movie)
        CLI.select_from_options(movie)
    end
end