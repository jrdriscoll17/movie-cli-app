class MovieData
    attr_accessor :title, :year

    def initialize(title, year = nil)
        @title = title
        @year = year if year
    end

    def call
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

    def display_genre
        self[Genre]
    end

    def display_rating
        self[Ratings][0][Value]
    end

    def display_plot
        self[Plot]
    end

    def display_year
        self[Released]
    end

    def display_runtime
        self[Runtime]
    end
end