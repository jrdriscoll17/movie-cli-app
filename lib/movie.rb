require_relative '../config/environment.rb'

class Movie
    attr_accessor :title, :year, :genre, :rating, :plot, :runtime

    @@all = []

    def initialize(title)
        @title = API.get_response(title)["Title"]
        @year = API.get_response(title)
        @genre = API.get_response(title)
        @rating = API.get_response(title)
        @plot = API.get_response(title)
        @runtime = API.get_response(title)

        @@all << self

    end

    #    API.get_response("batman")
       binding.pry


    # def call

    # end

    # def display_genre
    #     self[Genre]
    # end

    # def display_rating
    #     self[Ratings][0][Value]
    # end

    # def display_plot
    #     self[Plot]
    # end

    # def display_year
    #     self[Released]
    # end

    # def display_runtime
    #     self[Runtime]
    # end
end