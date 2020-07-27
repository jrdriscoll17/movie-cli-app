class MovieData
    def initialize(title, year = nil)
        @title = title
        @year = year if year
    end
end