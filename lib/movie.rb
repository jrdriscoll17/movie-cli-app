class Movie
    attr_accessor :title, :year, :genre, :rating, :plot, :runtime
    def initialize
        @title = API.get_response
        @year = API.get_response
        @genre =
        @rating =
        @plot =
        @runtime =
    end

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