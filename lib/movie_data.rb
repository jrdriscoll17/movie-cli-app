class MovieData
    attr_accessor :title, :year

    def initialize(title, year = nil)
        @title = title
        @year = year if year
    end

    def call

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